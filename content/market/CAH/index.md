---
title: "Cyclones-Atlantic-Hurricanes Market"
subtitle: "Market Information"
summary: ""
date: 2026-04-20T00:00:01+00:00
#draft: true 



image: 
  #caption: ""
  focal_point: "Top"
  preview_only: false


---


![Historic Atlantic Tropical Cyclone Activity](historic_atl_hurr.png)


# Market Specification: El Niño–Southern Oscillation (RONI)

## Market Overview

| Field | Details |
|---|---|
| **Market** | **OPER: CYCLONES-ATLANTIC-HURRICANES-YYYY**  Where YYYY is the calendar year.|
| **UNDERLYING** | Number of Atlantic hurricanes during the Atlantic hurricane season. |
| **PREDICTION PERIOD** | June 1 to November 30 | 
| **PREDICTION HORIZON** | Up to 12 months ahead, unless otherwise specified. | 

## Outcome Space

| Field | Details |
|---|---|
| **Dimensions** | One-dimensional (univariate) market |
| **Variable** | Number of Atlantic hurricanes |
| **Unit** | n/a |
| **Variable Type** | Categorical |
| **VALUES** | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20+ |
| **NUMBER OF OUTCOMES** | 21 |

## Market Hours

| Field | Details |
|---|---|
| **Opening Date/Time** | TBD |
| **Closing Date/Time** | TBD |

## Settlement

| Field | Details |
|---|---|
| **Primary Data Source** | NOAA National Hurricane Center <br>https://www.nhc.noaa.gov/ |
| **Secondary Data Source** | World Meteorological Organization: The US NHC is the sole Regional Meteorological Specialized Center (RMSC) for Atlantic hurricanes. If the NHC cannot fulfil this role it would fall on the WMO to designate an alternative RMSC. |
| **Source Reporting Date/Time** | 20YY-12-07 (i.e. any reclassification of storms after this date will not count in the settlement of the market). |
| **Settlement Date/Time** | December |

## Initialization

| Field | Details |
|---|---|
| **Initialization Type** | Prior modelled using historical data. |
| **Initial Prices** | Regularized Poisson fit to hurricanes (CAT1 to CAT5) observed since 1924. |

---

## Instructions

### Description of Market

This market is to predict the number of hurricanes that will occur during the official hurricane season (June 1 to November 30) of the designated year. The market will be settled in December following the end of the hurricane season using the number of hurricanes as determined by the U.S. National Hurricane Center (NHC).

Note 1: Hurricanes that occur after November 30 will not count towards the total for market settlement UNLESS the hurricane was already a named storm on or before November 30. 

Note 2: If the number of hurricanes for the season is not available from NHC the number as determined by the World Meteorological Organization (or its designated Regional Meteorological Specialized Center) will be used to settle the market. If the WMO does not provide a number, an alternate national meteorological service may be used. 

Note 3: The number of hurricanes used to settle will be the number as of 7th December 20YY, reclassifications of storms occurring after this date will not affect settlement.

### Instructions for Trading

#### Contracts

The *market* is based on individual outcomes. You can place bets and gain credits in the market through the trading of *contracts* — custom bets defined by you. A contract is a collection of *weights* for one or more of the outcomes for the market. Each unit of the contract that you own will pay out a number of credits equal to the weight of the event that occurs.

You can create contracts within the application by clicking on outcomes to select or deselect them, or by dragging to select groups of outcomes at once. Contracts created this way will have a weight of 1 on all selected outcomes and 0 for other outcomes, meaning each unit of these contracts will pay out 1.0 credit if the outcome that the market is settled at is one of the selected ones.

#### Getting Quotes and Trading

Once you have defined a contract you can get a price quote for the quantity you wish to buy. When getting a quote, you either specify the number you want to buy or specify what you want your final holding of that contract to be. You can then choose to trade at the quoted amount, which will create an order for the specified number of contracts.

If you wish to sell contracts you already own you can get a price quote in the same way. The price quoted might not be the price that you trade at, depending on whether other players have placed bets between getting the quote and placing the order. If the price moves against you more than 1% from the quoted amount, your order will be rejected.

#### Shorting

You cannot "short" contracts — that is, sell contracts you haven't previously bought. However, because the outcome space covers all possible outcomes and the prices sum to 1.00, if you believe any outcomes are overpriced it follows that other outcomes must be underpriced. You can take advantage of the mispricing by buying the underpriced outcomes.




<br> 

 








