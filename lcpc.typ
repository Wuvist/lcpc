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

Singapore is an advanced economy sometimes famous for its high GDP per capita and high living cost. These fames are usually news headlines which may be biased. Existing economic indicators may help public to have a glimpse of Singapore's economic from certain aspects, but seems none is directly reflecting living cost pressure among a society, and the reference values are limited. People need to digest multiple economic indicators in order to have a better understanding of Singaporean's living cost pressure. Furthermore, existing economic indicators have different issue when used for understanding living cost. This paper propose a new economic indicator LCPC - Living Cost Pressure Curve, aiming to have easy reference about living cost in societies to broader audience.

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
    rowspanx(3)[07/08], [Expenditure], [1,787], [2,950], [3,602], [4,569], [6,138],
    [Income], [1,466], [3,934], [6,175], [9,439], [19,511],
    [LCP], [1.22], [0.75], [0.58], [0.48], [0.31],
    rowspanx(3)[12/13], [Expenditure], [2,215], [3,531], [4,705], [5,596], [7,575],
    [Income], [1,949], [5,238], [8,355], [12,246], [24,547],
    [LCP], [1.14], [0.67], [0.56], [0.46], [0.31],
    rowspanx(3)[17/18], [Expenditure], [2,570], [3,753], [4,812], [5,826], [7,573],
    [Income], [2,235], [5,981], [9,678], [14,407], [26,587],
    [LCP], [1.15], [0.63], [0.50], [0.40], [0.28],
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
    rowspanx(3)[*07/08*], [Expenditure], [957], [2,121], [3,093], [4,423], [6,587], [8,222],
    [Income], [1,373], [3,946], [5,737], [9,028], [17,176], [21,198],
    [LCP], [0.70], [0.54], [0.54], [0.49], [0.38], [0.38],
    rowspanx(3)[*12/13*], [Expenditure], [1,287], [2,478], [3,918], [5,283], [8,000], [10,409],
    [Income], [1,855], [5,083], [8,043], [11,006], [20,534], [26,055],
    [LCP], [0.69], [0.49], [0.49], [0.48], [0.39], [0.40],
    rowspanx(3)[*17/18*], [Expenditure], [1,545], [2,709], [3,933], [5,504], [7,963], [10,500],
    [Income], [2,521], [5,868], [8,827], [12,244], [21,830], [28,937],
    [LCP], [0.51], [0.42], [0.44], [0.43], [0.37], [0.36],
  ),
  kind: table,
  caption: "SG Household income & expenditure by type of dwelling"
) <sg_household_by_dwelling>

These data provides insights about household living cost status in Singapore.

LPC focus on household's monthly all source expenditure and income, aiming to  reflect a household's cash flow status, which reflects pressure of living cost. Thus expenditures like imputed rental of owner-occupied accommodation should not be included when calculating expenditure.

Income include from all source that effects household's cash flow, for example salary, investment, rental income and regular government transfers like Workfare Income Supplement @wis.

LCP must be segmented, and LCP of different groups forms the a curve - LCPC. LCPC will show how live cost pressure are distributed among a society.

LCPC could be segmented using different ways. The most natural way will be segmented with income level. But using income level may have both pros and cons. We will exam constructing LCPC by income level and by type of dwelling using Singapore's data.

== Analysis of SG LCPC

=== Segmented by Income Quintile

Quick finding from SG LCPC by income quintile @sg_household_by_income:
- LCP decreases as income level increases
- LCPC shift downward from 2007/08 to 2017/18
  - All group faces lesser pressure
- 21th-40th group's LCP drop most significantly
- 81th-100th group's LCP didn't shift much
- 1st-20th group's LCP increase from 2012/13 to 2017/18, indicating this group by face large pressure.

However, the data of 1st-20th group deserve more careful examination:
- LCP is higher than 1, meaning expenditure exceed income.

This status does not necessarily implies that "Singapore's Poor struggles with household deficit". Within this group, 30%+ of household sole non-working household members of age 65+. i.e. retired elderly could be living saving, thus expenditure exceeds income#footnote[Retired elderly has no fixed salary, but could still have income from investment and rental.]. HES report indicates that #quote[It is notable, for example, that some resident households in the
lowest 20% owned a car (13.6 per cent), employed a maid (13.9 per cent), lived in private property (7.1 per cent) or were headed by persons aged 65 years and over (36.7 per cent) in 2017/18.], indicating group with low monthly income may not be poorest group.

=== By dwelling

Segmentation by type of dwelling on the other hand, may be better representing wealthiness of a household@sg_household_by_dwelling. There is strong corelation between amount of government transfer received and type of dwelling as shown in Key Household Income Trends, 2023 report@income_trend by SingStat and the group of received most government transfer is the one dwell in HDB#footnote[HDB stands for House Development Board, and it's often referred to the public house developed by Singapore government - House Development Board.] 1 & 2 Room flat#footnote[Key Household Income Trends, 2023 Chart 6: Average Annual Government Transfers Per Household Member shows that Government Transfers tends to decrease as type of dwelling improve]. Thus, if we are concerned about status of low class in Singapore, it's better to look at the group stay in HDB 1-2 room flat, instead of the group having the lowest income.

Type of dwelling in Singapore are typically segmented into:

#figure(
  tablex(
    columns: 7,
    align: center + horizon,
    auto-vlines: false,
    rowspanx(2)[],colspanx(4)[*HDB*], rowspanx(2)[*Condo#footnote[Condominiums & Other Apartments]*], rowspanx(2)[*Landed#footnote[Landed Properties]*],
    (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room and EC#footnote[Executive Condominiums which sold by HDB, provide better housing but government sponsored.]*],(),
    [Percentage], [7.0%], [17.0%], [31.3%], [22.4%], [17.2%], [4.8%],
  ),
  kind: table,
  caption: "Resident Households by Type of Dwelling 2023"
) <households>

Unique in the world, about 77.8%@dwelling_types of Singaporean household stay in HDB. The remaining household stay in private properties like Condo(17.2% of household) and landed properties(4.8% of household).

It's worth noting that when segmenting by type of dwelling, the proportion of each segment may not be the same. "HDB 4 Room" actually represent about 31.3% of household, much greater then the bottom 7.0% stays in HDB 1-2 Room.

LCPC doesn't requires size of each segment to be equal, it's more important to make each segments representative. i.e. audience is easier to understand which people belongs to which segments and thus create reference value.

Comparing to by income level, although the segments are evenly distributed, but audience may hard to project themselves into corresponding group. One may think they belongs to "middle-income", when while they are actually among the top 20% earners. Or the opposites may also happen.

Segmenting by dwelling type on the other hand, provides a clear cut of who should belong to each segment. The SG LCPC by type of dwelling @sg_household_by_dwelling has been striped off household with sole member of age 65+ and segmented by household#[It's also possible to form another LCPC focusing this group alone, the data is available in HES. I will exam in future study.].

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

=== Factors impacting SG LCPC

==== Income [TBA]
- Covid
- Why high income group's LCP increase?
- Does Progressive wage scheme help the bottom income group?

==== GST increment

Singapore Government increase GST from 7% to 9% in 2023 and 2024, with 1% increment each year, and it applies to all expenditure of all segments. Assuming Singaporeans doesn't change consumption with new GST, i.e. inelastic to price change of 1%; this policy will shift whole LCPC upwards, but the shape remains.

Singapore government does provide "Assurance Package" to help low income families@ap_support cushion the impact of the GST increment, thus this policy will have an "bending effect" on LCPC, potentially making it more flatten.

When HER 2022/23 report is available, I could re-visit with the new data.

= Estimation of other LCPC

== Mortgage Repayment

HES's expenditure doesn't include Mortgage Repayment. The housing category expenditure in HES report only includes@hes:
* Housing(Rentals) And Utilities
* Furnishings, Household Equipment And Routine Household Maintenance

I initially tried to include mortgage repayment into household expenditure. According to HES 2022/23 Information Pamphlet, HES does collect home mortgage repayment data, but not revealed in report. It's not only hard to find statistic for Singaporean's mortgage repayment, making reasonable estimation of mortgage repayment is also very hard.

Mortgage is determined largely at the moment of purchase, and it varies a lot from one household to another. It's hard to estimate which age group of household purchase their first house, nor to mention segmented it by income quintiles or type of dwelling.

Mortgage rate may changes,. But about 80% of Singapore household stays in HDB, and the interest rate of HDB's loans is pegged to +0.1% of interest rate of CPF ordinary account@hdb_interest, which is 2.5% since July 1999@cpf_interest. Market interest rate may change, but it will be capped to 2.6% - HDB rates. Condo & landed properties owners may need to take loans from commercial banks, and the rate would have much higher fluctuations. But that only impacts the top 20% high income household.

Furthermore, MAS has MRS limit: 30%@tdsr.

If we do a extreme estimation of that all household takes the maximum housing loans, it just discounts LCP of all segment to 70%, and has no impact on the shape of the LCPC.

From an accounting perspective, property is considered as an asset of an household, "buying" of house is actually turning cash assets to fixed asset, and may not incur any expenditures, it could even be considered as an investment. It's only the interest payment of mortgage could be considered actual expenditure.

Mortgage impact of LCPC would be future research topic, for this paper, I decides to exclude mortgage repayment when constructing LCPC.


== Rental - LCPC for foreigner in Singapore

Rental on housing is an area worth deeper analysis. Home ownership rate is almost 90% in Singapore@sg_home_ownership, thus rental may not be a significant factor for Singaporean household's expenditure. But Singapore is a society consisting about 30%, or 1.77M non-residents@sg_population, including foreign students, workers and professionals etc.

Singapore forbids foreigner making purchase of HDB and most landed properties, the additional buyer-side stamp duty (ABSD) for foreign buyers also has been increasing#footnote[https://www.iras.gov.sg/taxes/stamp-duty/for-property/buying-or-acquiring-property/additional-buyer's-stamp-duty-(absd)]. Thus rental would play a major factor for foreigner staying in Singapore's LCP.

It's feasible to construct an estimated LCPC for foreign workers in Singapore for 2023:

#figure(
  image("data/LCPC_foreign.png"),
  caption: "ESTIMATED SG LCPC for foreigners by type of work pass"
) <sg_lcpc_by_pass>

Quick findings:
- WP group has LCP very close to 1, implying they are very closed to face deficit or cash flow issues. The minimum WP salary required by MOM may not be sufficient for them to support their life in Singapore. Their monthly expenditure are already closed to the minimum by having expenditures similar to the bottom 7% local, i.e. the group stay in HDB 1-2 Room and they only assumed to share HDB room with another worker. There is not much room to cut expenditure given the ever increasing CPI in Singapore. THus, the way for WP group to fight with high LCP may  work overtime and get additional income.
- The group estimated to have both lowest LCP(0.56) and highest LCP(1.05) are WP holders, depending on the type of housing they rent. Monthly rental is the most significant factor affecting their LCP. Middle class professional considering relocating to Singapore may find living cost unbearable if they want to stay in condo and maintain corresponding life style. But, they would find comfort if they choose to rent HDB and have moderate life style just like the majority of Singaporeans.
- High income professional like PEP/ONE pass holders faces similar LCP below 0.7. They are the target audience of WCOL by EIU. Despite Singapore may have the highest cost of living in the world, the high income of expatriate may make them still find it manageable.

=== Estimation of data

For estimation, I assume Work Permit(WP), S-Pass(SP) and Employment Pass(EP) holders are individual bearing they own expenditure, whereas Personalised Employment Pass(PEP) bear expenditure of a family of three, and Overseas Networks & Expertise Pass(ONE Pass) holder bear expenditure of a family of four. Their rentals are estimated from average rental price of 4room HDB and 3-bedroom condo, which WP holder share one 1 HDB bed room and ONE Pass holder rent the whole condo unit. Monthly expenditure excluding rental are estimated from household expenditure data from HES and CPI. Monthly rental are estimated from average rental 4room HDB and 3 bedroom condo.

As for income, I use minimum salaries required by Ministry of Manpower for each type of pass. Detailed code for estimations are in @code.

#figure(
  tablex(
    columns: 7,
    align: center + horizon,
    auto-vlines: false,
    rowspanx(2)[], rowspanx(2)[*WP*], rowspanx(2)[*SP*], colspanx(2)[*EP*], rowspanx(2)[*PEP*], rowspanx(2)[*ONE Pass*],
    [*Rent HDB*], [*Rent Condo*],
    [Estimated Expenditure], [1,010], [1,667], [1,667], [3,454], [10,362], [13,816],
    [Estimated Rental#h(28pt)], [562], [1,126], [1,126], [2,328], [4,656], [6,983],
    [Estimated Income#h(24pt)], [1,600], [3,150], [5,000], [5,500#footnote[minimum salary requirement for EP in Financial Sector]], [22,500], [30,000],
    [LCP], [0.98], [0.89], [0.56], [1.05], [0.67], [0.69],
  ),
  kind: table,
  caption: "ESTIMATED SG foreign worker's income & expenditure by type of work pass"
) <sg_worker_by_pass>

= LCPC for other economies

The proposed indicator LCPC should be flexible and applicable to economy besides Singapore. When constructing LCPC for other economies, we must look into the specified characteristics of the economy.

For example, when segmenting by income level, could be applied to other economies without modification, providing household expenditures & income data by income level are available.

As mentioned earlier, segmenting by income level has its pro and cons. And in Singapore's case, segmenting by type of dwelling would provide better insight. However, this approach is unique to Singapore.

When constructing LCPC for other economies, we may need to digest the characteristics of the local societies, and pick representing segmentation. It could be by income level, or by race/ethnic groups etc.

As LCPC for different economies may used different segmentation approach. Comparison of LCPC may not be meaningful. But, LCP as a scalar may be used for comparison among economies.

The shape and movement of LCPC in different period may also be used from cross comparison.

== Comparison with Hong Kong

Census and Statistics Department (C&SD) in Hong Kong also conducts Household Expenditure Survey once every 5 years. Thus allows me to construct a similar LCPC for Hong Kong:

#figure(
  image("data/LCPC_hk.png"),
  caption: "ESTIMATED HK LCPC by type of housing"
) <sg_lcpc_by_pass>

C&SD separate type of housing into three main group:
- Public Housing
- Subsidised Housing
- Private Housing

Hong Hong have about 51.50% Home Owner Rate@hk_home_ownership, thus rental payment would be a significant factor when constructing LCPC.

If we exclude rent payment, all 3 groups face similar LCP about 0.64; but when rental is included into expenditure, LCP of the two non-public housing group jump significantly. Implying a much higher living cost pressure if residents in Hong Kong are not able to stay in public housing.

If I would allowed to do cross comparison of LCP between Singapore and Hong Kong, then the LCP of Subsidised Housing group(0.97) is actually higher than SP group in SG LCPC for foreign workers(0.89). Thus, this may provides incentive for Hong Kong resident to migrate to work in Singapore, if they could obtained a S-Pass or above.

=== Data for Hong Kong

Expenditure data for Hong Kong are obtained from Household Expenditure Survey: @hk_expenditure.

However, report of Household Expenditure Survey only includes household's average expenditure data but not income. Thus the income data is obtained from @hk_income. Unfortunately, this income data only reports median income level, but not average#footnote[Whereas Household Expenditure Survey only reports average expenditure, but not median.]. Thus the LCP for Hong Kong are calculated using the ratio between average expenditure over median income. If we assume that average income is higher than median, then these LCP would be lower if using average income, i.e. the whole LCPC may shift downward.

#figure(
  tablex(
    columns: 4,
    align: center + horizon,
    auto-vlines: false,
    [], [*Public Housing*], [*Subsidised Housing*], [*Private Housing*],
    [*Average* Rent], [1,701], [10,100], [15,218],
    [*Average* Expenditure#footnote[Included rent]], [15,018], [27,631], [37,895],
    [*Median* Income], [18,250], [28,400], [38,900],
    [LCP], [0.82], [0.97], [0.97],
  ),
  kind: table,
  caption: "Hong Kong Household expenditure & income by Type of housing"
) <hk_households>

Expenditure & income data in @hk_households are measured in HKD, no currency conversion are need, as LCP is a ratio which won't be affected by change of currency.

= Conclusion

The main purpose of LCPC is to propose a easy-to-use indicator for living cost pressure measurements, it has only two simple idea:
- Take ratio of expenditure and ratio to represent: pressure
- Perform meaningful segmentation to show how pressure is distributed.

As show cased in this paper, LCPC would have reference value to varies audiences:
- Local resident interested about how their living cost pressure comparing to other groups.
- Foreign worker/student considering working in another country
- Researchers interested in comparing of living cost pressure between economies
- Researchers interested in measuring government policies affecting different groups

Bottom line, I hope SG's LCPC would be a response if WCOL by EIU hits news headlines again this year.

= Appendix

== Detail calculation of foreign worker LCPC <code>

```julia
using CSV, DataFrames, GLM
# http://www.singstat.gov.sg/whats-new/latest-news/cpi-highlights
# data/cpi_jan24.xlsx
# Sheet 3 Prices and Price Indices  Consumer Price Index (CPI), 2019 As Base Year, Annual
# CPI: All Items Less Accommodation
cpi = [74.531, 74.290, 74.854, 76.378, 76.803, 77.572, 79.332, 83.623, 83.176, 85.923, 89.561, 92.662, 94.421, 95.566, 95.658, 95.971, 97.742, 99.067, 100.000, 99.657, 102.197, 108.992, 114.334]
cpi_0708 = (cpi[7] + cpi[8]) / 2
cpi_1213 = (cpi[12] + cpi[13]) / 2
cpi_1718 = (cpi[17] + cpi[18]) / 2
cpi_23 = cpi[23]

df = DataFrame()
df.cpi = [cpi_0708, cpi_1213, cpi_1718]

# HES - Chart 1.10: Average Monthly Household Expenditure Per Household Member by Type of Dwelling, 2007/08 - 2017/18
df.e_1room = [491, 653, 772]
df.e_4room = [919, 1162, 1320]
df.e_condo = [2169, 2717, 2794]

m_1room = lm(@formula(e_1room ~ cpi), df)
m_4room = lm(@formula(e_4room ~ cpi), df)
m_condo = lm(@formula(e_condo ~ cpi), df)

alpha_1room, beta_1room = coef(m_1room)
alpha_4room, beta_4room = coef(m_4room)
alpha_condo, beta_condo = coef(m_condo)

e_1room = alpha_1room + beta_1room * cpi_23
e_4room = alpha_4room + beta_4room * cpi_23
e_condo = alpha_condo + beta_condo * cpi_23

# https://www.hdb.gov.sg/residential/renting-a-flat/renting-from-the-open-market/rental-statistics
HDB_4room_rent = [3380, 3280, 3600, 3150, 3900, 3000, 4100, 3100, 3800, 3100, 3150, 3500, 3200, 3500, 3080, 3300, 3300, 4300, 3200, 3200, 3400, 3300, 3500, 3000, 3100]
# 4room HDB flat has 3 bed room for rent
rent_1_HDB_room = sum(HDB_4room_rent) / length(HDB_4room_rent) / 3
# 7.31 from https://www.ura.gov.sg/property-market-information/pmiResidentialRentalStatisticsForNonLanded
# data/condo_2023Q{1-4}.csv

condo_23Q1 = CSV.read("data/condo_2023Q1.csv", DataFrame)
condo_23Q2 = CSV.read("data/condo_2023Q2.csv", DataFrame)
condo_23Q3 = CSV.read("data/condo_2023Q3.csv", DataFrame)
condo_23Q4 = CSV.read("data/condo_2023Q4.csv", DataFrame)

median_PSF = [condo_23Q1."Median (\$ PSF per month)"; condo_23Q2."Median (\$ PSF per month)";
    condo_23Q3."Median (\$ PSF per month)"; condo_23Q4."Median (\$ PSF per month)"]
mean_median_PSF = sum(median_PSF) / length(median_PSF)

# estimate size of 3 bedroom condo: 1350 sf
rent_condo_3room_flat = 1350 * mean_median_PSF
rent_condo_1room = rent_condo_3room_flat / 3
rent_condo_2room = rent_condo_1room * 2

e_WP = rent_1_HDB_room / 2 + e_1room
e_SP = rent_1_HDB_room + e_4room
e_EP_hdb = rent_1_HDB_room + e_4room
e_EP_FSS_Condo = rent_condo_1room + e_condo
e_PEP = rent_condo_2room_flat + e_condo * 3
e_ONE = rent_condo_3room_flat + e_condo * 4

# min salary requirement
# https://www.mom.gov.sg/passes-and-permits/work-permit-for-foreign-worker/sector-specific-rules/services-sector-requirements
# https://www.mom.gov.sg/passes-and-permits/s-pass/upcoming-changes-to-s-pass-eligibility
# https://www.mom.gov.sg/passes-and-permits/employment-pass/eligibility#ep-qualifying-salary
# https://www.mom.gov.sg/passes-and-permits/personalised-employment-pass/eligibility-and-requirements
# https://www.mom.gov.sg/passes-and-permits/overseas-networks-expertise-pass/eligibility
i_WP = 1600
i_SP = 3150
i_EP_HDB = 5000
i_EP_FSS_Condo = 5500
i_PEP = 22500
i_ONE = 30000

LCPC_foreign = [e_WP, e_SP, e_EP_hdb, e_EP_FSS_Condo, e_PEP, e_ONE] ./ [i_WP, i_SP, i_EP_HDB, i_EP_FSS_Condo, i_PEP, i_ONE]
```

#bibliography("lcpc.bib", style:"harvard-cite-them-right")
