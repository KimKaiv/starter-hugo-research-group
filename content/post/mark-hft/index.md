---
title: "Preventing high frequency trading in a climate prediction market"
subtitle: ''
summary: ''
authors: ["Mark Roulston"]
tags: ["Mark Roulston"]
categories: []
date: 2024-10-07T00:00:01+00:00
lastmod: 2024-10-07T00:00:01+00:00
featured: false
draft: false

#    Featured image
#    To use, add an image named `featured.jpg/png` to your page's folder.
#    Focal points... Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.

image: 
  caption: ""
  focal_point: "center"
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
**High frequency trading can increase the speed at which new information is incorporated into prices in a prediction market, but this extra speed might be unnecessary for the usefulness of the forecasts the market is producing.**

Suppose prediction markets for climate risks became well established and the forecasts they generated were widely used by policy makers and decision makers for informing policies concerning greenhouse gas emissions and for planning adaptation to climate change. Climate experts could take part in these markets which would aggregate their views, and the market prices could incorporate new information as it becomes available to the participants.

> If the forecast horizon of the prediction market is years, it won’t make much difference to decision makers whether it takes seconds or hours for the new information to be incorporated into prices. 

When a new forecast or data set is published, if the market allows round-the-clock and continuous trading, participants will want to be the first to trade on this new information. But, if the forecast horizon of the market is weeks, or even years, it won’t make much difference to decision makers whether it takes seconds or hours for the new information to be incorporated into prices. The participants constantly refreshing their browsers to be the first to get the forecast and trade on it, or writing code to do this automatically, will be doing something no more socially useful than if they were trying to secure tickets for a Taylor Swift or Oasis concert. 

Financial markets suffer from the same problem. There is a high frequency arms race in which traders try to be the first to respond to changes in asset prices that will affect the prices of other assets. For example, when the same, or closely related securities, are traded on two different exchanges it is an opportunity for high frequency arbitrage. Some firms have built dedicated private fibre optic and microwave links to communicate price changes between exchanges a fraction of a second faster than their competitors. It is debatable whether this high frequency trading disadvantages retail investors but it is not debatable that many smart people are engaged in this activity and are expending real-world resources in the race to be first. However, speeding up price discovery by fractions of a second is not necessarily useful to the real economy. Whether it’s because of this social wastefulness, its purported negative effect on retail investors, or its alleged contribution to "flash crashes", people have proposed [regulating or banning high frequency trading](https://www.economicsreview.org/post/should-high-frequency-trading-be-regulated). The enforcement of regulations in a continuously traded market would be a challenge so it has been suggested that the continuous nature of the market itself is a design flaw and that high frequency trading could be eliminated by changing the design.

Eric Budish , Peter Cramton and John Shim have advocated replacing continuous trading 
in financial markets with "[frequent batch auctions](https://academic.oup.com/qje/article/130/4/1547/1916146)". Traders would submit bids and 
offers to the market and an auction would be held at regular intervals to match buyers 
and sellers. Within each auction the order in which bids and offers were submitted is 
irrelevant, so there is nothing to be gained by being faster than the interval between 
the auctions. This interval could be as little as one tenth of a second in financial 
markets, which would still allow price discovery to occur swiftly enough for the purposes 
of decision making in the real economy, but would render the construction of private 
communication links and "co-locating" to be closer to exchanges pointless.

> Eliminating the potential returns to high frequency trading would focus participants in a climate prediction market on improving the long-range climate predictions that the market is meant to deliver.

CRUCIAL's platform runs climate prediction markets with expert participants using 
continuous trading. It can support markets with thousands of distinct outcomes 
because it uses an [automated market maker](https://mason.gmu.edu/~rhanson/mktscore.pdf). 
This is essential because, with so many 
outcomes, it might be unlikely that any two participants will want to trade identical 
baskets of outcomes, so directly matching buyers and sellers is impractical. Implementing 
frequent batch auctions for such markets requires an auction algorithm that can deal 
with this problem. A [recently published paper](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0309164) 
by myself and [Kim Kaivanto](https://www.crucialab.net/author/kim-kaivanto/) describes an 
auction algorithm that directly compares bids and offers of baskets of different outcomes 
based on the premium being offered above what the automated market maker would quote.
 Although the algorithm has only been used so far as a way to set initial prices in a 
 prediction market it could also be used to run frequent batch auctions.

Climate prediction markets are intended to be an efficient mechanism for aggregating 
climate expertise and incentivizing climate researchers to improve forecasts of 
climate-related risks. To prevent the efforts of researchers from being diverted 
towards trading fractions of a second faster than other participants frequent batch 
auctions might be a better approach than continuous time trading.

<br>

*Photo credit: https://www.flickr.com/photos/countylemonade/ 

<br>

The original version of this article appeared as 
[Preventing high frequency trading in a climate prediction market](https://www.linkedin.com/pulse/preventing-high-frequency-trading-climate-prediction-market-roulston-kcsvf/) 
on LinkedIn. 

<br>

