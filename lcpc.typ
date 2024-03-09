#import "paper_template.typ": paper
#import "@preview/tablex:0.0.8": tablex, colspanx, rowspanx

#show: doc => paper(
  title: [Living Cost Pressure Curve, a Singapore example],
  authors: (
    (
      name: "Weng Wei",
      affiliation: "",
      email: "",
      note: "Singapore Management University, wei.weng.2022@mse.smu.edu.sg",
    ),
  ),
  date: "Mar 2024",
  abstract: [In this paper, I propose a new economy indicator: LCPC - Living Cost Pressure Curve, aiming to provide holistic view of living cost pressure among a society. I used Singapore as a example, but the methodology is applicable to other economies, and possible to make cross comparison of LCPC among different economies. LCPC provides better reference to a much broader audience about living cost than existing indicator like CPI.],
  keywords: [
    Household Analysis, Household Finance, Demographic Economics, Economic indicator, Social indicator,],
  acknowledgments: "This paper is a work in progress.",
  doc,
)

#set text(spacing: 100%)
#set par(
  leading: 1.2em,
  first-line-indent: 2em,
  justify: true,
)

= Introduction

Singapore is an advanced economy sometimes famous for its high GDP per capita and high living cost. These fames are usually news headlines which may be biased. Existing economic indicators may help public to have a glimpse of Singapore's economic from certain aspects, but seems none is directly reflecting living cost pressure among a society, and the reference values are limited. People need to digest multiple economic indicators in order to have a better understanding of Singaporean's living cost pressure. Furthermore, existing economic indicators have different issue when used for understanding living cost. This papar propose a new economic indicator LCPC - Living Cost Pressure Curve, aiming to have easy reference about living cost in societies to broader audience.

When living cost is concerned, Consumer Price Index (CPI) is a commonly used indicator. According to Singapore Statistic Department(SingStat) @sg_cpi, the annual CPI using 2019 As Base Year increase from 74 in 2000 to 109 in 2022, but it doesn't imply that Singaporean's living cost pressure also increased by 47%. Singaporeans's income level may also increase during the same period. If income level increase at a faster rate than CPI, the actual economic pressure from living cost may drop.

GDP per capita measured in PPP includes income factors, but it could be distorted. For example, an economy like Singapore which has significant portion of GDP contributed by international trade, its GDP may not fully reflects the income level of local people.

Another commonly cited indicator is the Economist Intelligence Unit's (EIU) Worldwide Cost of Living (WCOL) survey@eiu. In this yearly survey, it consistently ranks Singapore as the city with highest live cost in the world and attracts media attentions.

#quote[The survey has been designed to enable human resources and finance managers to calculate cost-of-living allowances and build compensation packages for expatriates and business travelers]@eiu But when WCOL survey report is covered by media, public may have the misconception that its data is aiming to reflect the living cost of local people.

Singapore government responded to WCOL survey in Dec 2023@sg_response, pointing out two reasons for #quote[it may not reflect the cost of living for Singaporeans]:
- The WCOL survey's consumption basket does not reflect what Singaporeans usually consume
- The rankings are sensitive to currency fluctuations

Beside these two reason, WCOL has same issue as CPI: It doesn't contain information about income level.

In general, if an economic indicator is represented as an scalar like the three mentioned above, it won't be able to reflect diversification within a society. Scalar as an one dimensional number is not suitable for describing situation across different segments of an economy. When concerning living cost pressure, it's a status tends varies among different classes within a society. Different representation of economic indicator is needed.

In order to create more holistic view of living cost of a economy, the proposed indicator is a curve: Living Cost Pressure Curve(LCPC).

Living Cost Pressure(LCP) is obtained by:

$ L C P = (sum "Expenditure")/(sum "Income") $

Indicators like CPI and EIU's WCOL are essentially a weighted sum of living cost. In order to capture living cost pressure faced by consumer, it not enough to just consider living cost metrics. Living cost must be used to against values like income to represent pressure faced. LCP is just the ratio of nominal sum of a household total expenditure over its all source income over a period.

= Singapore's Result

A quick glance of LCPC for Singapore segmented by income quintile and by type of dwelling for three different period: 2007/08, 2012/13 and 2017/18 are:
#figure(
  image("data/LCPC_income.png"),
  caption:"SG LCPC by income"
) <sg_lcpc_by_income>

#figure(
  image("data/LCPC_dwelling.png"),
  caption: "SG LCPC by type of dwelling"
) <sg_lcpc_by_dwelling>

The expenditure and income mentioned above are referring to the average household monthly expenditure of all form and average monthly income from all source.

There are tow main benefit of such approach.

1. No weighted conversion is needed, just using nominal dollar values numbers and sum could be easily calculated. If we want to evaluate impacts of certain price change, like fresh food price shock. We will need to look into composition of the "Overall expenditure". By taking simple sum, we just need to calculated the nominal dollar changes. No weighted conversion is needed, and it reflects the actual situation faced by household: Individual household income/expenditure accounting also use nominal values without any conversion.
2. Denoted In local currency, robust to currency fluctuations. Thus, avoid the issue of WCOL survey pointed out by Singapore government.

== Data from Household Expenditure Survey

The expenditure and income data used for constructing above LCPC are from Household Expenditure Survey(HES) conducted by the Singapore Department of Statistics@hes. HES is conducted every 5 years since 2007/08. Currently 3 survey's data are available: 2007/08, 2012/13 and 2017/18. #footnote[The latest survey data for year 2023/24 should be released in mid 2024. This paper will update with the new data once available.]

Each HES surveyed about 13,000 dwelling units in Singapore, and reported household income and expenditure data.

Household expenditure and income data segmented by income quintile:
#figure(
  tablex(
    columns: 7,
    align: center + horizon,
    auto-vlines: false,
    [*Year*], [*Type*], [*1st-20th*], [*21st-40th*], [*41st-60th*], [*61st-80th*], [*81st-100th*],
    rowspanx(2)[07/08], [Expenditure], [1,787], [2,950], [3,602], [4,569], [6,138],
    [Income], [1,466], [3,934], [6,175], [9,439], [19,511],
    rowspanx(2)[12/13], [Expenditure], [2,215], [3,531], [4,705], [5,596], [7,575],
    [Income], [1,949], [5,238], [8,355], [12,246], [24,547],
    rowspanx(2)[17/18], [Expenditure], [2,570], [3,753], [4,812], [5,826], [7,573],
    [Income], [2,235], [5,981], [9,678], [14,407], [26,587],
  ),
  kind: table,
  caption: "SG Household income & expenditure by income quintile"
) <sg_household_by_income>

Household expenditure and income data segmented by type of dwelling:
#figure(
  tablex(
    columns: 8,
    align: center + horizon,
    auto-vlines: false,
    rowspanx(2)[*Year*], rowspanx(2)[*Type*], colspanx(4)[*HDB*], rowspanx(2)[*Condo*], rowspanx(2)[*Landed*],
    (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room and EC*],(),
    rowspanx(2)[*07/08*], [Expenditure], [957], [2,121], [3,093], [4,423], [6,587], [8,222],
    [Income], [1,373], [3,946], [5,737], [9,028], [17,176], [21,198],
    rowspanx(2)[*12/13*], [Expenditure], [1,287], [2,478], [3,918], [5,283], [8,000], [10,409],
    [Income], [1,855], [5,083], [8,043], [11,006], [20,534], [26,055],
    rowspanx(2)[*17/18*], [Expenditure], [1,545], [2,709], [3,933], [5,504], [7,963], [10,500],
    [Income], [2,521], [5,868], [8,827], [12,244], [21,830], [28,937],
  ),
  kind: table,
  caption: "SG Household income & expenditure by type of dwelling"
) <sg_household_by_dwelling>

These data provides insights about household living cost status in Singapore.

LPC focus on household's monthly all source expenditure and income, aiming to  reflect a household's cash flow status, which reflects pressure of living cost. Thus expenditures like imputed rental of owner-occupied accommodation should not be included when caculating expenditure. 

Income include from all source that effects household's cash flow, for example salary, investment, rental income and regular government transfers like Workfare Income Supplement @wis.

LCP must be segmented, and LCP of different groups forms the a curve - LCPC. LCPC will show how live cost pressure are distributed among a society.

LCPC could be segmented using different ways. The most natural way will be segmented with income level. But using income level may have both pros and cons. We will exam constructing LCPC by income level and by type of dwelling using Singapore's data.

== Analysis of SG LCPC

=== Segmentated by income quintile

Quick finding from SG LCPC by income quintile @sg_household_by_income:
- LCP decreases as income level increases
- LCPC shift downward from 2007/08 to 2017/18
  - All group faces lesser pressure
- 21th-40th group's LCP drop most significantly
- 81th-100th group's LCP didn't shift much
- 1st-20th group's LCP increase from 2012/13 to 2017/18, indicating this group by face large pressure.

However, the data of 1st-20th group deserve more careful examination:
- LCP is higher than 1, meaning expenditure exceed income.

This status does not nessesarily implies that "Singapore's Poor struggles with household deficit". Within this group, 30%+ of household sole non-working household members of age 65+. i.e. retired olderly could be living saving, thus expenditure exceeds income#footnote[Retired olderly has no fixed salary, but could still have income from investment and rental.]. HES report indicates that #quote[It is notable, for example, that some resident households in the
lowest 20% owned a car (13.6 per cent), employed a maid (13.9 per cent), lived in private property (7.1 per cent) or were headed by persons aged 65 years and over (36.7 per cent) in 2017/18.], indicating group with low monthly income may not be poorest group.

=== By dwelling

Segmentation by type of dwelling on the other hand, may be better representing wealthiness of a household@sg_household_by_dwelling. There is strong corelation between amount of government transfer received and type of dewelling as shown in Key Household Income Trends, 2023 report@income_trend by SingStat and the group of received most goverment transfer is the one dwell in HDB#footnote[HDB stands for House Development Board, and it's offen refered to the public house developed by Singapore government - House Development Board.] 1 & 2 Room flat#footnote[Key Household Income Trends, 2023 Chart 6: Average Annual Government Transfers Per Household Member shows that Government Transfers tends to decrease as type of dwelling improve]. Thus, if we are concerned about status of low class in Singapore, it's better to look at the group stay in HDB 1-2 room flat, instead of the group having the lowest income.

Type of dwelling in Singapore are typically segmented into:

#figure(
  tablex(
    columns: 7,
    align: center + horizon,
    auto-vlines: false,
    (), colspanx(4)[*HDB*], rowspanx(2)[*Condo#footnot[Condominiums & Other Apartments]*], rowspanx(2)[*Landed#footnote[Landed Properties]*],
    (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room and EC#footnote[Executive Condominiums which sold by HDB, provide better housing but government sponsed.]*],(),
    [Percentage], [7.0%], [17.0%], [31.3%], [22.4%], [17.2%], [4.8%],
  ),
  kind: table,
  caption: "Resident Households by Type of Dwelling 2023"
) <households>

Unique in the world, about 77.8%@dwelling_types of Singaporean household stay in HDB. The remaining household stay in private properties like Condo(17.2% of household) and landed properties(4.8% of household).

It's worth noting that when segmenting by type of dwelling, the proportion of each segment may not be the same. "HDB 4 Room" actually represent about 31.3% of household, much greater then the bottom 7.0% stays in HDB 1-2 Room.

LCPC doesn't requires size of each segment to be equal, it's more important to make each segments representative. i.e. audience is easier to understand which people belongs to which segments and thus create reference value.

Comparing to by income level, although the segments are evenly distributed, but audience may hard to project themselves into corresponding group. One may think they belongs to "middle-income", when while they are actually among the top 20% earners. Or the opposites may also happen.

Segmenting by dwelling type on the other hand, provides a clear cut of who should belong to each segment. The SG LCPC by type of dwelling @sg_household_by_dwelling has been striped off household with sole member of age 65+ and segmented by household#[It's also possible to form another LCPC analysing this group alone, the data is available in HES].

Quick findings from this LCPC:
- All LCP below 1: no household face deficit
- LCP drop as type of dwelling improve in 2012/13
- LCP actually has "bounds" as dwelling improve in 2017/18
- LCP drop significantly for the 80% household stays in HDB - Public Housing from 2012/13 to 2017/18
- LCP actually increase slightly for the 20% household stays in private housing
- LCPC "flatten" from 2012/13 to 2017/18

These phenomenons may be results of:
- Government policies favoring Singaporean staying HDB
- Lack of income increment opportunities for the "rich Singaporean"
- Upgrading to better dwelling or moving to a more expensive life-style may increase LCP, "richer" household faces more economic pressure than the previous group
  - Significant increase in pressure when moving from public housing to private
  - "Squeezed Middle Class" - Singaporean household exceeds qualification for HDB, but not rich enough for private housing faces large economic pressure

[TBA] more analysis/metrics




= Conclusion

= Mortgage Payment

HES's expenditure doesn't include Housing loan repayment.

The housing category expenditure in HES report only includes@hes:
* Housing(Rentals) And Utilities
* Furnishings, Household Equipment And Routine Household Maintenance

I did tried hard to find statistic for Singaporean's mortgage, but not able to get any statistical data or estimations could fitted into LCP.

According to HES 2022/23 Information Pamphlet, HES does collect home mortgage repayment data, but not revealed in report.

Mortgage is determined largely at the moment of purchase, and it varies a lot from one household to another. It's hard to estimate which age group of household purchase their first house, nor to mention segmented it by income level or type of house.

Mortgage rate may changes, but about 80% of Singapore household stays in HDB, and the interest rate of HDB's loans is pegged to +0.1% of interest rate of CPF ordinary account@hdb_interest, which is 2.5% since July 1999@cpf_interest.

Market interest rate may change, but it will be capped to 2.6% - HDB rates. Condo & landed properties owners may need to take loans from commercial banks, and the rate would have much higher fluctuations. But that only impacts the top 20% high income household.

Furthermore, MAS has MRS limit: 30% @tdsr.

If we do a extreme estimation of that all household takes the maximum housing loans, it just discounts LCP of all segment to 70%, and has no impact on the shape/distribution of the LCPC.

From an accounting point of view, property is considered as an asset of an household, "buying" of house is actually turning cash assets to fixed asset, and may not incur any expenditures, it could even be considered as an investment. It's only the interest payment of mortgage could be considered actual expenditure.

Mortgage impact of LCPC would be future research topic, perhaps using another economy like Hong Kong as object.

= Rental - LCPC for foreigner in Singapore

Rental on housing is a also a topic worth deeper analysis. Home ownership rate is almost 90% in Singapore@sg_home_ownership, thus rental may not be a significant factor for Singaporean household's expenditure. But Singapore is a society consisting about 30% non-residents[ref TBA], including foreign students, workers and professionals.

Singapore forbids foreigner making purchase of HDB and most landed properties, the additional buyer-side stamp duty (ABSD) for foreign buyers also has been increasing. Thus rental would play a major factor for foreigner staying in Singapore's LCP.

HES focused on local household, thus didn't have any data on this aspect.

But, it's feasible to construct an estimated LCPC for foreigner in Singapore.

[TBA] HDB Rental / Condo rental data & construct LCPC and findings

Just use typical case:
* WP 1600 - E-HDB 1/2
  * HDB 1 room share, HDB 4 room rental / 6
* SP 3,150  E-HDB 3
  * HDB 2000 1 room alone, HDB 4 room rental / 3
* EP holder income threshold 5,600 E-HDB 4
  * Condo 1 room 7.31
* PEP 22,500 Family 1 kids; two room condo
* One Pass 30,000 Family, two kids; 3 room condo

947 \* 7.31 / 3
2307.52

700 \* 7.31
5117.0

1200 \* 7.31
8772.0

= Factors impacting LCPC

== Income [TBA]
- Covid
- Why high income group's LCP increase?
- Does Progressive wage scheme help the bottom income group?

== GST

Singapore Government increase GST from 7% to 9% in 2023 and 2024, with 1% increment each year, and it applies to all expenditure of all segments. Assuming Singaporeans doesn't change consumption with new GST, i.e. inelastic to price change of 1%; this policy will shift whole LCPC upwards, but the shape remains.

However, Singapore government did provide tax relief to low income families[ref TBA], thus this policy will have an "bending effect" on LCPC, potentially making it more flatten.

When HER 22/23 report is available, we could re-visit with the new data.

= LCPC for other economies

The proposed indicator LCPC should be flexible and applicable to economy besides Singapore. When constructing LCPC for other economies, we must look into the specified characteristics of the economy.

For example, when segmenting by income level, could be applied to other economies without modification, providing household expenditures & income data by income level are available.

As mentioned earlier, segmenting by income level has its pro and cons. And in Singapore's case, segmenting by type of dwelling would provide better insight. However, this approach is unique to Singapore.

When constructing LCPC for other economies, we may need to digest the characteristics of the local societies, and pick representing segmentation. It could be by income level, or by race/ethnic groups etc.

As LCPC for different economies may used different segmentation approach. Comparison of LCPC may not be meaningful. But, LCP as a scalar may be used for comparison among economies.

The shape and movement of LCPC in different period may also be used from cross comparison.

== Comparison with Hong Kong

Hong Kong income@hk_income and expenditure @hk_expenditure.

[TBA] formula for calculating flatness? Just use the variance

For example, the more flatten the LCPC(no matter how it's segmented) may implies a more equal society. Thus, we could compare flatness of different economies. It could actually serve as alternative to GINI co-efficient, as GINI co-efficient only accounts for different in income, and didn't include expenditures data.

[TBA] Bias of ignore in dollar value: Dollar value of (I - E) could be another indicator: Live Cost Surplus Curve???

= Conclusion

The main purpose of LCPC is to propose a indicator/framework for living cost pressure measurements, it has only two simple idea:
- Take ratio of expenditure and ratio to represent: pressure
- Perform meaningful segmentation to show how pressure is distributed.

The paper also used Singapore's data to show how simple idea of LCPC could reveal more meaningful household characteristics from the comprehensive HER reports, and make it good reference to larger group of audiences as well.

#bibliography("lcpc.bib", style:"harvard-cite-them-right")
