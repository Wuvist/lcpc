# Summary

Singapore is an advanced economy sometimes famous for its high GDP per capita and high living cost. These fames are usually news headlines which may be biased[ref TBA]. Existing economic indicators may help public to have a glimpse of Singapore's economic from certain aspects, but they are usually not comprehensive. Public need to digest multiple economic indicators in order to have a better understanding of Singaporean's living cost pressure. In this paper, I propose a new economy indicator: LCMC - Living Cost Misery Curve, which provide holistic view of living cost pressure of a society in a single curve. My focus will be Singapore, but the methodology should be applicable to other economies, cross comparison of LCMC among different economies is also possible.

# Issues of existing economic indicators

## CPI

When considering living cost, Consumer Price Index (CPI) is a commonly used indicator. According to Singapore Statistic Department[ref TBA], the annual CPI using 2019 As Base Year increase from 74 in 2000 to 109 in 2022, but it doesn't imply that Singaporean's economic pressure also increased by 47%. Singaporeans's income level may also increase during the same period. If income level increase at a faster rate than CPI, the actual economic pressure from living cost may drop.

## GDP per capita measured in PPP

GDP per capita includes income factors, but it could be distorted. For example, an economy like Singapore which has significant portion of GDP contributed by international trade, its GDP may not fully reflects the income level of local people.

## Worldwide Cost of Living by EIU

Another commonly cited indicator is the Economist Intelligence Unit’s (EIU) Worldwide Cost of Living (WCOL) survey. In this yearly survery, it consistanly ranks Singapore as the city with highest live cost in the world and attracts media attentions.

"The survey has been designed to enable human resources and finance managers to calculate cost-of-living allowances and build compensation packages for expatriates and business travellers"[ref TBA] But when covered by media, public may have the misconconception that this survey is reflecting living cost of local people.

Singapore government responsed[ref TBA] to this survey in Dec 2023, pointing out two reasons for "it may not reflect the cost of living for Singaporeans":
* The WCOL survey’s consumption basket does not reflect what Singaporeans usually consume
* The rankings are sensitive to currency fluctuations

Beside these two reason, WCOL has same issue as CPI: It doesn't contains information about income level.

## Common issue of Index indicator

Society is diversified, society has classes. Economic index indicators are usually an scalar. Scalar as an one dimensional number could never contains enough information for describe situation across different segments of an economy.

In order to create more holistic view of living cost of a economy, the proposed indicator is a curve: Living Cost Misery Curve.

# Living Cost Misery Curve - LCMC

## Basic Formula

A better and in fact nature way of have both all categories of expenditure and all source of income included.

$ LCM = "Overall expenditure"/"All source income" $

Benefit of:
* No weitage conversion is needed, just using norminal numbers
  * If we want to evaluate an impact of certain price change, like fresh food price shock
  * We will need to look into composition of the "Overall expenditure". But again, no weightage conversion is needed, we just need to calculated the nomail dollar changes.
* Denoted In local currency, robust to currency fluctuations
* Is log tranform needed? No?

It reflects an individual or a household's cash flow status, which reflects pressure of living cost.

## Forming curve

In order to provide a holistic view of living cost pressure in a society, its not enough to calculate a the expenditure & income of a "Representive Consumer/household"

# Singapore's data

## Household Expenditure Survey

Singapore Statistic Department conducts Quinquennial Household Expenditure Survey[ref TBA] staring from 2007.

## Segmentation

### By income groups

It shows:

Issue: 30%+ of household in bottom 20% income segments are sole household of 65+

Retired elderly may have no income, but potentially high saving.

### Household types

- HDB 1 & 2 Room
- HDB 3 Room
- HDB 4 Room
- HDB 5 Room & EC
- Condo
- Landed

Relief of lower income groups are more significated. Top 20% household are actually "worse off".

Waves in 12/13 data: HDB 4 ROOM & Condo

Possiable explaination:
* Squezed middle class
* Cut off

A more detailed analysis will need to have housing loan data.

### Housing loan

HES's expenditure doesn't include Housing loan repayment.

The housing category expenditure only includes:
*
*

I did tried to find statistic for Singaporean's mortage, but it's very hard:
* HES did collect the data, but did not reveal

Housing loan is determined largly at the moment of purchase, and it varies a lot from household to household. It's hard to estimate which age group of household purchase their first house, nor to mention segmented it by income level or type of house.

The mortage rate may changes, but about 80% of Singapore household stays in HDB, and the HDB housing loans interest rate is pegged[ref TAB] to +0.1% of interest rate of CPF ordinary account, which is 2.5% since July 1999[ref TAB].

Market interest rate may change, but it will be capped to 2.6% - HDB rates. Condo & landed properies owners may need to take loans from commercial banks, and the rate would have much higher flutuations. But that only impacts the top 20% hight income household.

Furthermore, MAS has MRS limit, 30%.

If we do a extreme estimation of that all household takes the maxinum housing loans, it just discounts LCM of all segment to 70%, and has no impact on the shape/distribution of the LCMC.

Finally, from an accounting point of view, property is considered as an asset of an household, when spending

Housing impact of LCMC would be future research topic, perhaps using another economy like Hong Kong as object.

### Rental

It could be worthy to dive more into

#### Good reference to foreigner

* Student / foreign workers

Rental is an income of the local - already included in LCMC.

HDB & condo rental stats are available.

*HDB Rental*[ref TBA]

# Condo District
3 Queenstown, Alexandra, Tiong Bahru
In long-ago times, MSR was capped at 40% of a borrower’s gross monthly income. Then in January 2013, it was lowered to 35%. At the same time, the Monetary Association of Singapore (MAS) set an MSR limit of 30% for bank-issued loans for HDB flats.

Normanton Park[ref TBA]
1 bedroom: 527
2 bedroom: 656
3 bedroom: 936

Possiable to adapt LCMC for reference of foreigners.

# Factors impacting LCMC

## Income

Covid

high income

wait for 22/23 HES.

Progressive wage?

## GST

Singapore Government increase GST from 7% to 9% in 2023 and 2024.

1% increasement to all expenditure of all segments.

Singapore govenemnt did provide tax relief to low income families[ref TBA], thus this policy will have an "bending effect" on LCMC.

# How to apply LCMC?

Accounts for expenditure & income carefully
Like weather to con

## Segmentation

Segment carefully!

By income level? By dwelling? By race/ethnic group? By age? By education/level?

Segmentation could be an IV.

# Limitations

* No Data for 07/08????
* Only considering SG, better to have another city
* Estimation of expenditure needs review
* Bais of ignore in dollar value: Dollar value of (I - E) could be another indicator: Live Cost Luxury Curve

# Summary

The main purpose of LCMC is to propose a indicator/framework for living cost measurements
* Provision impacts of government policy
* Better reference for local & foreigners
* Comparison amony cities/economies


# Reference

Table 14
Resident Households by Income Quintile 1/ and Type of Dwelling

Table 18A
Average Monthly Household Expenditure Among Resident Households by Type of Goods and Services (Detailed) and Type of Dwelling

Chart 1.10: Average Monthly Household Expenditure1 Per Household Member
by Type of Dwelling, 2007/08 - 2017/18

# Number of household
1068907

76961,240651,430965,320330,207282,69038

# Income

1st 2nd 3rd 4th 5th 6th 7th 8th 9th 10th
2022 $689 $1,347 $1,864 $2,400 $2,976 $3,634 $4,447 $5,578 $7,493 $14,354
2023 $706 $1,421 $1,987 $2,563 $3,169 $3,857 $4,729 $5,892 $7,862 $14,803

https://www.valuechampion.sg/home-loans/average-cost-housing-singapore


