---
title: "Abundance of Choice"
date: 2022-09-24T17:28:43+01:00
#draft: true 



image: 
#  caption: ""
  focal_point: "Top"
#  preview_only: false
---

Complex statistical analysis and mathematical modelling involve multitudes of
choices and assumptions. Recent _"many analysts, one data set"_ studies show the 
danger of relying solely on one research team. 

Here we present several examples from this literature. 

We also present an example from climate modelling in which variations
in modelling choices account for a greater share of variance than variations in 
scenario choice. 

<br> 

## [Silberzahn et al. (2018)](https://journals.sagepub.com/doi/abs/10.1177/2515245917747646) --- social science, psychology

> Twenty-nine teams involving 61 analysts used the same data set to address the same
research question: whether soccer referees are more likely to give red cards to 
dark-skin-toned players than to light-skin-toned players. ...Twenty teams (69%) found a
statistically significant positive effect, and 9 teams (31%) did not observe a significant
relationship. Overall, the 29 different analyses used 21 unique combinations of covariates. 
_...significant variation in the results of analyses of complex data may be difficult
to avoid, even by experts with honest intentions._

![Covariates included by each team](silber_table.png "Table: Covariates included by each team.")

![Odds Ratios across 29 teams](silber_ORs_by_team.jpeg "Figure: Odds ratios across 29 teams.")

![OR point estimates clustered by analytic approach](silber_ORs_by_analytic_approach.jpeg "Figure: OR point estimates clustered by analytic approach.")

>The observed results from analyzing a complex data set 
can be highly contingent on justifiable, but subjective, 
analytic decisions. Uncertainty in interpreting research 
results is therefore not just a function of statistical power 
or the use of questionable research practices; it is also 
a function of the many reasonable decisions that 
researchers must make in order to conduct the research.

<br> 

## [Huntington-Klein et al. (2021)](https://onlinelibrary.wiley.com/doi/epdf/10.1111/ecin.12992) --- economics

These researchers ask whether two published empirical studies reporting causal 
empirical results replicate when this is attempted by multiple research teams. 

1. Black et al. (2008) Staying in the classroom and out of the maternity ward? 
   The effect of compulsory schooling laws on teenage births. _The Economic Journal_, 
   118(530): 1025--1054. [Link](https://academic.oup.com/ej/article-abstract/118/530/1025/5089485)
2. Fairlie et al. (2011) Is employer-based health insurance a barrier to entrepreneurship?
   _Journal of Health Economics_, 30(1): 146--162. [Link](https://www.rand.org/pubs/working_papers/WR637-1.html)

They recruit 49 published researchers to participate in replication teams. 

After attrition (due to a short completion window), they obtained 7 independent
replications of each study. 

![Compulsory education](hk_compulsory_education.png "Figure: Results from compulsory education (\#1.) replication study.")

![Health insurance](hk_health_insurance.png "Figure: Results from health insurance (\#2.) replication study.")

> Researchers make hundreds of decisions about data collection, preparation, and
analysis in their research. ...We find large differences in data preparation and analysis 
decisions, many of which would not likely be reported in a publication. No two 
replicators reported the same sample size. Statistical significance varied across 
replications, and for one of the studies the effect's sign varied as well. _The
standard deviation of estimates across replications was 3--4 times the mean reported
standard error._

<br> 

## [Breznau et al. (2022)](https://osf.io/preprints/metaarxiv/cd5j9/) --- economics, statistics

These authors pose the question: _does immigration reduce support for 
social policies among the public_?

To answer it, they recruited 162 participants across 73 teams. 

Each team was provided with a database of answers to a 6-question module on the 
role of government in providing different social services, which is part of the
long-running International Social Survey Programme (ISSP). They were also provided
with a wide range of World Bank, OECD, and immigration data. 

![Variation in AME](breznau_AME.png "Figure: Variation in Average Marginal Effect (AME) across 73 teams testing the same hypothesis with the same data. AME, point estimate, and Confidence Interval for each team.")

> ...major research steps explain at most 2.6\% of total variance in effect sizes and
10\% of the deviance in subjective conclusions. Expertise, prior beliefs and attitudes
explain even less. _Each generated model was unique, which points to a vast universe
of research design variability normally hidden from view_ in the presentation, consumption, 
and perhaps even creation of scientific results.

<br> 

## [Sognnaes et al. (2021)](https://www.nature.com/articles/s41558-021-01206-3) --- emissions modelling

Authors develop explicit forward projections of _CO2 mitigation efforts_ post-2030. 
They employ two different formulations of future emissions mitigation to generate scenarios: 
(i) continuing _rates_ of emissions-intensity reduction, i.e. emissions per unit of GDP, and 
(ii) scaling of carbon prices in proportion to per capita GDP growth. 

Whereas in many studies and applications, scenario pathways are identified through
'backcasting' from future climate targets, Sognnaes et al. (2021) employ two formulations
of near-term mitigation efforts --- current policies (CPs) and nationally determined 
contributions (NDCs) --- to which they apply the above-mentioned (i) and (ii) long-term 
emissions-mitigation extensions beyond 2030. This results in a 2x2 matrix of combinations. 

They then simulate forward emissions pathways using a diverse set of _seven_ Integrated 
Assessment Models (IAMs): 

 - [The Global Change Analysis Model (GCAM)](https://jgcri.github.io/gcam-doc/overview.html)
 - [The TIMES Integrated Assessment Model (TIAM)](https://www.ucl.ac.uk/energy-models/models/tiam-ucl)
 - [ModUlar energy system Simulation Environment (MUSE)](https://www.imperial.ac.uk/muse-energy/)
 - [FortyTwo](https://www.i2am-paris.eu/detailed_model_doc/42)
 - [The General Equilibrium Model of International-National Interactions between Economy, Energy, and the Environment (GEMINI-E3)](https://link.springer.com/article/10.1007/s10287-007-0047-y)
 - [Intertemporal Computable Equilibrium System -- eXtended Public Sector (ICES-XPS)](https://link.springer.com/article/10.1007/s10584-020-02664-y)
 - [The Energy-Environment-Economy Macro-Econometric model (E3ME)](https://www.e3me.com/)

![Global energy CO2 emissions; based on current policy](Sognnaes_CP.JPG "Figure: Global energy CO2 emissions to 2050 in CP scenarios. Shaded areas show emissions spanned by CP_Price and CP_Intensity scenarios for each model, and coloured bars show 2050 ranges (2045 value for FortyTwo, which has only intensity scenarios). Markers above bars show baseline values in 2050 (in 2045 for FortyTwo).")
![Global energy CO2 emissions; based on nationally defined contributions](Sognnaes_NDC.JPG "Figure: Global energy CO2 emissions to 2050 in NDC scenarios. Shaded areas show emissions spanned by NDC_Price and NDC_Intensity scenarios for each model, and coloured bars show 2050 ranges (2045 value for FortyTwo, which has only intensity scenarios). Markers above bars show baseline values in 2050 (in 2045 for FortyTwo). ")

The authors conclude that:
> ... _the model used has a larger impact on results than the method used to extend mitigation effort forward,_
 which in turn has a larger impact on results than whether CPs or NDCs are assumed in 2030. 
The answer to where emissions are headed -- which is a critical question to inform policymakers 
about how much ambition needs to be raised to reach climate targets -- might therefore depend 
more on the choice of models used and the post-2030 assumptions than on the 2030 target 
assumed. This renders estimates of temperature consequences of NDCs and CPs _sensitive to study design_ 
and _highlights the importance of using a diversity of models and extension methods to capture this uncertainty._



<br> 

## Synopsis

These studies have explicit selection criteria to ensure that they recruit only competent 
researchers.  

Prior to studies of this nature, the "degrees of freedom" inherent in empirical 
analysis were not fully appreciated by researchers.  

More than abundance of choice, these studies reveal a vast universe of previously hidden
research-design and analysis-operationalisation variability. 




<br> 

<br> 








