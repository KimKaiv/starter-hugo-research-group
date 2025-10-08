### agora-client R helper functions
### Version: 2025-10-06 

### These functions are wrappers for calling agora-client.exe from R. 
### They use R's 'shell' function to call agora-client. This command is only available in R for Windows. 
### In other versions of R you can use the 'system' function to send commands to the shell.
### Most of the functions require the name of your biscuit file that can be downloaded from AGORA under the 'Profile' tab.
### After downloading your biscuit file call pubkey(biscuit_file) to get your public key and paste this public key
### into your profile https://agora.crucialab.net/profile.
### NB: The wrapper functions don't have error trapping for failed calls to the API.

### You are free to use, modify (improve!) and share this code.
### We take no responsibility for its correctness or accept any 
### responsibility or liability for its use.

require(jsonlite)
require(stats)

pubkey = function( biscuit_file ) {
	### Returns your public key to paste into your Profile page on AGORA.
	cmd = sprintf("agora-client --biscuit-file %s pubkey new",biscuit_file)
	x = shell(cmd,intern=TRUE,ignore.stderr=TRUE)
	return(x)
}

get_me = function( biscuit_file ) {
	### Returns your user_id and email address.
	cmd = sprintf("agora-client --biscuit-file %s get me", biscuit_file)
	me = shell(cmd,intern=TRUE,ignore.stderr=TRUE)
	return(fromJSON(me))
}

get_markets = function( biscuit_file, market_id=NULL ) {
	### Returns a data frame with information about one market (if market_id given)
	### or all markets (if no market_id given).
	if (is.null(market_id)) {
		cmd = sprintf("agora-client --biscuit-file %s get market",biscuit_file)
	} else {
		cmd = sprintf("agora-client --biscuit-file %s get market --market-id %i",biscuit_file,market_id)
	}
	markets = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))
	return(markets)
}

get_prices = function ( biscuit_file, market_id=NULL ) {
	### Returns a data frame with prices and supplementary data for one market (if market_id given)
	### or all markets (if no market_id given).
	if (is.null(market_id)) {
		cmd = sprintf("agora-client --biscuit-file %s get price",biscuit_file)
	} else {
		cmd = sprintf("agora-client --biscuit-file %s get price --market-id %i",biscuit_file,market_id)
	}
	prices = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))					
	prices = prices[order(prices$outcome_id),]	### sort rows by outcome_id
	return(prices)
}

get_contracts = function ( biscuit_file, market_id=NULL ) {
	### Returns a data frame listing all your defined contracts for one market (if market_id given)
	### or all markets (if no market_id given).
	if (is.null(market_id)) {
		cmd = sprintf("agora-client --biscuit-file %s get contract",biscuit_file)
	} else {
		cmd = sprintf("agora-client --biscuit-file %s get contract --market-id %i",biscuit_file,market_id)
	}
	contracts = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))					
	return(contracts)
}
		
post_trade = function( biscuit_file, trade ) {
	### pPlaces a trade passed as a list object.
	### Example: trade = list(contract_id=1115,contracts=+10,market_id=107)
	### Basket trades can be passed as a list of lists.
	### example: trade = list(list(contract_id=1115,contracts=+10,market_id=107),list(contract_id=1116,contracts=-20,market_id=107))
	### Function returns a data frame giving details of the trade that actually occurred.
	tradeInstruction = toJSON(trade,auto_unbox=TRUE)
	cmd = sprintf('echo %s | agora-client --biscuit-file %s post execution',tradeInstruction,biscuit_file)
	tradeResult = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))
	return(tradeResult)
}

create_contract = function( biscuit_file, contract ) {
	### pPlaces a trade passed as a list object.
	### Example: contract = list(contract=unbox("Name of Contract"),market_id=unbox(107),outcomes=c(315,324))
	### Basket trades can be passed as a list of lists.
	### example: contract = list(list(contract=unbox("Name of Contract 1"),market_id=unbox(107),outcomes=315,list(contract=unbox("Name of Contract 2"),market_id=unbox(107),outcomes=324)))
	### NB: This wrapper doesn't use auto_unbox=TRUE because the outcomes must be boxed, even if there is only one outcome
	### in the contract. Therefore, the unbox() function has to be used for the contract and market_id attributes.
	contractInstruction = toJSON(contract, auto_unbox=FALSE) 
	cmd = sprintf('echo %s | agora-client --biscuit-file %s post contract',contractInstruction,biscuit_file)
	contractResult = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))
	return(contractResult)
}

get_balance = function( biscuit_file ) {
	### Returns balance info for each 'pool' you have access to.
	cmd = sprintf('agora-client --biscuit-file %s get balance',biscuit_file)
	balances = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))
	return(balances)
}

get_portfolio = function( biscuit_file ) {
	### Returns your portfolio.
	cmd = sprintf('agora-client --biscuit-file %s get portfolio',biscuit_file)
	portfolio = fromJSON(shell(cmd,intern=TRUE,ignore.stderr=TRUE))
	return(portfolio)
}

append_outcome_ids = function(contracts, prices) {
	### This function appends outcome_ids to the contracts data structure by cross-referencing with
	### a price data structure.
	### It returns a contract data structures with the outcome_ids added.
	if (length(unique(contracts$market_id)) > 1) { stop("contracts object contains information for multiple markets") }
	if (length(unique(prices$market_id)) > 1) { stop("prices object contains information for multiple markets") }
	if (contracts$market_id[1] != prices$market_id[1]) { stop("contracts and prices objects refer to different markets") } 
	nContracts = nrow(contracts)	
	nPrices = nrow(prices)
	outcome_ids = contracts$outcomes
	nElements = length(prices[1,]$values[[1]])	### number of elements describing each outcome 
	for (iContract in c(1:nContracts)) {
		tmp = as.matrix(contracts[iContract,]$outcomes[[1]]) ### array of outcomes
		nOutcomes = length(tmp)/nElements
		outcome_ids[[iContract]] = rep(NA,nOutcomes)
		outcome_array = array(as.vector(contracts$outcomes[[iContract]]),c(nOutcomes,nElements))
		for (iOutcome in c(1:nOutcomes)) {
			for (iPrices in c(1:nPrices)) {
				tmp1 = as.vector(prices$values[[iPrices]])
				tmp2 = as.vector(outcome_array[iOutcome,])
				if (identical(tmp1,tmp2)) {
					outcome_ids[[iContract]][iOutcome] = prices$outcome_id[[iPrices]]
				}
			}
		}
	}
	contracts$outcome_ids = outcome_ids
	return(contracts)
}

get_market_info = function( biscuit_file, market_id) {
	### Returns market information for a specified market. This includes current prices and inferred open interest
	### (i.e. market maker holdings) of each outcome.
	### It also returns your own exposure to each outcome by summing up the contracts in your portfolio.
	markets = get_markets( biscuit_file, market_id )
	prices = get_prices( biscuit_file, market_id )
	prices = prices[order(prices$outcome_id),]	### sort rows by outcome_id
	contracts = get_contracts( biscuit_file, market_id )
	contracts = append_outcome_ids( contracts, prices )	### add the outcome ids to the contracts structure
	portfolio = get_portfolio( biscuit_file )
	q = (markets$liquidity_factor)*log(prices$price)
	q = q - min(q)
	prices$open_interest = q
	prices$exposure = rep(0,length(q))
	nContracts = nrow(contracts)
	for (iContract in c(1:nContracts)) {
		iPortfolio = which(portfolio$contract_id == contracts$contract_id[iContract])
		if (length(iPortfolio) > 0) {	### is this contract in your portfolio	
			indices = match(contracts$outcome_ids[[iContract]],prices$outcome_id)
			prices$exposure[indices] = prices$exposure[indices] + portfolio[iPortfolio,]$contracts
		}
	}
	return(list(market_details=markets,market_info=prices))
}

logexpsum = function(q,b) {
	### calculates log(sum(exp(q/b))) avoiding overflow errors
	x = q/b
	maxx = max(x)
	x = x - maxx
	return(maxx+log(sum(exp(x))))
}

budget_constrained_trade = function( current_price, target_price, budget, b ) {
	### This function calculates a trade to move a market from 'current_price' towards 'target_price'
	### if you can only spend 'budget'. 
	### current_price, target_price: vectors of prices for outcomes
	### budget: maximum spend allowed
	### b: liquidity factor for the market (can be obtained by calling get_markets)
	objective = function( offset ) { 
		w = delta_q - offset
		w[w<0] = 0
		return(b*logexpsum(current_q+w,b) - b*logexpsum(current_q,b) - budget)  
	}
	current_q = b*log(current_price) - b*min(log(current_price))### current open interest inferred from prices (up to a constant)
	target_q = b*log(target_price) - b*min(log(target_price))	### target open interest that would move prices to target_price
	delta_q = target_q - current_q					### required trade
	delta_q = delta_q - min(delta_q) 					### substract constant to make trade non-negative
	full_cost = b*logexpsum(current_q+delta_q,b) - b*logexpsum(current_q,b) ### cost of implementing the full trade 
	if (full_cost <= budget) {
		### you can afford the full trade
		w = delta_q			
	} else {
		### The full trade is beyond specified budget so it will be 'trimmed' to meet the budget.
		### The trimming involves subtracting a constant from every outcome but imposing a floor of zero. 
		root = uniroot(objective,c(0,max(delta_q)))
		w = delta_q - root$root
		w[w<0] = 0
	}
	final_price = exp((current_q+w)/b)/sum(exp((current_q+w)/b))		### final price that will be achieved
	actual_cost = b*logexpsum(current_q+w,b) - b*logexpsum(current_q,b)	### the actual cost of the trade
	return(list(trade=w,current_price=current_price,target_price=target_price,final_price=final_price,full_cost=full_cost,actual_cost=actual_cost))
}




