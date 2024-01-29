= Living Cost Misery Index
=== ECON6017 Paper 1st progress - Weng Wei

== Motivation

There is no existing economic index reflecting living cost of local people in different cities in the world, nor to make comparison.

Existing relevant indexes have limitations:
- Worldwide Cost of-Living by EIU - Economist Intelligence Unit
  - https://www.eiu.com/n/campaigns/worldwide-cost-of-living-2023/
  - More for expats like managers working for MNC 's reference
  - Not reflecting living cost bared by the locals
  - SG was ranked 1st
- CPI
  - Reflecting Inflation, not necessarily living cost -> living cost & income may increase at the same time
- GDP per capita using PPP
  - PPP adjusted index for purchasing power
  - But GDP may not reflecting income of local -> lots for foreign trade
  - Could be misleading: SG was ranked 1st

== Living Cost Misery Index

LCMI - Living Cost Misery Index could be very simple:

$ "LCMI" = "Essential Living Expanse"/"Income" "(Monthly)" $

- Essential Living Expanse could consist:
  - Housing (Rental / Mortgage)
  - Food
  - Transportation
  - Communication
  - Clothing
  - Health
  - Education
  - Entertainment

- Income is relatively simple:
  - Payroll

=== Typical Groups

Living Cost could be very different for different group of people depending on their life style, especially in SG:

- HDB vs Condo
- Hawker Center/Food Court vs Restaurant
- Public transport vs Grab/Self driving
- Public school vs Private school
- etc


Estimate(or survey) cost of each category into different levels, and choose different category levels to form typical groups, like:

- High: Expat
- Medium-High Income: PMET worker
- Medium: Worker
- Medium-Low 
- Low

Or group by housing type(SG government like to use housing type to separate residence into different income group)?

== LCMI curve

Calculate LCMI for each groups in a city and form a LCMI curve:
- Will the middle class being the most miserable?

LCMI curve of different cities could be used for comparison:
- No need to adjust for exchange? As it's a ratio of local currency?
- Could serve as a reference for people consider to relocation
  - Just make a estimate of the denominator: income
  - Even for foreign student with no income
- Could also serve as alternative to gini coefficient

== Factors impacting LCMI

Can regress on different price factor to show impact on LCMI:
- Inflation
- Increase in GST
  - How effective f government subsidies?
- Increase in interest rate/mortgage rate
- Increase in rental
  - In SG case, it's not necessary impacting LCMI negatively
  - High housing ownership
  - Increase in rental could be increase of income for the landlords, i.e. the locals
- etc

== Conclusion

LCMI curve as a framework to find out when where is a change in certain price, how each typical group in society will be affected.

Expand & Income categories could be expanded/fine tuned, linkages could be built.

PS: As an software engineer, I would also build a website/app to let consumer adjust arbitrary price factor to forecast the impact. Perhaps, it could serve as a tool to estimate new government policy's index? (I suppose SG government should already have this kind of benchmark tool? Is it publicly available?)

= My questions

- How to set clear scope
  - Just cover LCMI for SG or include other cities like HK/Shanghai/New York?
- Shall collect historical data to see how LCMI changes?
- How many groups to have for LCMI curve?
- Really no existing index solve this problem?
- How many price factors to evaluate? And how to evaluate?
