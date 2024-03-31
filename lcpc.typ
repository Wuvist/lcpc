#import "paper_template.typ": paper
#import "@preview/tablex:0.0.8": tablex, colspanx, rowspanx
#import "@preview/wordometer:0.1.1": word-count, total-words

#show: word-count.with(exclude: (heading.where(level: 1), raw.where(block: true)))

#show: doc => paper(
  title: [Living Cost Pressure Curve in Singapore and beyond],
  authors: (
    (
      name: "Weng Wei",
      affiliation: "",
      email: "",
      note: "Singapore Management University, wei.weng.2022@mse.smu.edu.sg",
    ),
  ),
  date: "April 2024",
  abstract: [This paper introduces the Living Cost Pressure Curve (LCPC) as a novel economic indicator aimed at providing a comprehensive measure of living cost pressures across various societal segments. By establishing the LCPC and applying it to an in-depth analysis of Singapore, the study underscores the indicator's versatility and effectiveness in capturing economic nuances that traditional measures like the Consumer Price Index (CPI) often miss. Utilizing data from Singapore's Household Expenditure Surveys and segmenting the LCPC by dwelling type, this research reveals intricate dynamics of living cost pressures among different groups within the economy. An estimated LCPC for foreign workers in Singapore, categorized by type of work pass, offers valuable insights for individuals contemplating relocation. A comparative analysis with Hong Kong further demonstrates the LCPC's adaptability in reflecting the distinct socio-economic characteristics of various regions, highlighting significant disparities in living cost pressures faced by households in Singapore and Hong Kong. This disparity is primarily attributed to rental expenditures, pinpointing them as a crucial factor behind the economic challenges encountered by Hong Kong residents, in contrast to the potential for significant savings among Singaporean households. These findings advocate for the LCPC's capacity to provide a more holistic and accurate understanding of economic pressures arising from living costs, thereby furnishing local residents, foreign workers, and policymakers with a clearer perspective of the economic landscape.],
  keywords: [
    Household Analysis, Household Finance, Demographic Economics, Economic indicator, Social indicator,],
  acknowledgments: "This paper is a work in progress.",
  doc,
)

#set par(
  leading: 1.2em,
  first-line-indent: 2em,
  justify: true,
)

= Introduction

Singapore is an advanced economy sometimes famous for its high GDP per capita and high living cost. These fames are usually news headlines which may be biased. Existing economic indicators may help public to have a glimpse of Singapore's economic from certain aspects, but seems none is directly reflecting living cost pressure among a society, and the reference values are limited. People need to digest multiple economic indicators in order to have a better understanding of living cost pressure of a society. Furthermore, existing economic indicators have different issue when used for understanding living cost. This paper propose a new economic indicator LCPC - Living Cost Pressure Curve, aiming to have easy reference about living cost in societies to broader audience. This paper also analyze living cost pressure in both Singapore and Hong Kong by utilizing LCPC.

When living cost is concerned, Consumer Price Index - CPI is a commonly used indicator. According to Singapore Statistic Department - SingStat @sg_cpi, the annual CPI using 2019 as base year increases from 74 in 2000 to 109 in 2022, but it doesn't imply that Singaporean's living cost pressure has increased by 47%. Singaporeans's income level also has increased during the same period. If income level increase at a faster rate than CPI, the actual economic pressure from living cost could be even lower.

GDP per capita measured in PPP includes income factors, but it could be distorted. For example, an economy like Singapore which has significant portion of GDP contributed by international trade, its GDP may not fully reflects the income level of local people.

Another commonly cited indicator is Worldwide Cost of Living - WCOL survey@eiu by Economist Intelligence Unit - EIU. In this yearly survey, it consistently ranked Singapore as the city with highest live cost in the world and attracts media attentions.

#quote[The survey has been designed to enable human resources and finance managers to calculate cost-of-living allowances and build compensation packages for expatriates and business travelers]@eiu But when WCOL survey report is covered by media, public may have the misconception that its data is aiming to reflect the living cost of local people.

Singapore government responded to WCOL survey in Dec 2023@sg_response, pointing out two reasons for #quote[it may not reflect the cost of living for Singaporeans]:
- The WCOL survey's consumption basket does not reflect what Singaporeans usually consume
- The rankings are sensitive to currency fluctuations

Beside these two reason, WCOL also has same issue as CPI: It doesn't contain information about income level.

In general, if an economic indicator is represented as an scalar like the three mentioned above, it won't be able to reflect diversification within a society. Scalar as an one dimensional number is not sufficient for describing situation across different segments of an economy. When concerning living cost pressure, it's a measurement tends varies among different classes within a society. Different representation of economic indicator is needed.

In order to create more holistic view of living cost of a economy, the proposed indicator is a curve: Living Cost Pressure Curve - LCPC.

Living Cost Pressure - LCP is defined by:

$ L C P = (sum "Expenditure")/(sum "Income") $

Indicators like CPI and EIU's WCOL are essentially a weighted sum of living cost. In order to capture living cost pressure faced by consumer, it not enough to just consider living cost metrics. Living cost must be used to against values like income to represent pressure faced. LCP is just the ratio of nominal sum of a household total expenditure over its all source income over a period. Both expenditure and income are denoted in local currency.

LCP provide quick understanding about affordability of a household expenditure. If LCP equals to 1, it implies the household is struggling to meet its expenditure needs. If LCP is above one, it implies the household is running on deficit. The household may need to spend its saving or work hard to increase income. If LCP below one, it means the household face less living cost pressure and could have extra saving.

#colbreak()

= LCPC for Singapore

A quick glance of LCPC for Singapore segmented by income quintile and by type of dwelling for three different period: 2007/08, 2012/13 and 2017/18 are:
#figure(
  image("data/LCPC_income.png", width: 80%),
  caption:"SG LCPC by income"
) <sg_lcpc_by_income>

#figure(
  image("data/LCPC_dwelling.png", width: 80%),
  caption: "SG LCPC by type of dwelling"
) <sg_lcpc_by_dwelling>

The expenditure and income mentioned above are referring to the average household monthly expenditure of all form and average monthly income from all source.

There are tow main benefit of such approach.

1. No weighted conversion is needed, just using nominal dollar values and their sum could be easily calculated. If we want to evaluate impacts of certain price change, like fresh food price shock. We will need to look into composition of the "Overall expenditure". By taking simple sum, we just need to calculated the nominal dollar changes. No weighted conversion is needed, and it reflects the actual situation faced by household: Individual household income/expenditure accounting also use nominal values without any conversion.

2. Denoted In local currency, robust to currency fluctuations. Thus, avoid the issue of WCOL survey pointed out by Singapore government.

== Data from Household Expenditure Survey

The expenditure and income data used for constructing above LCPC are from Household Expenditure Survey - HES@hes conducted by the SingStat. HES is conducted every 5 years since 2007/08. Currently 3 survey's data are available: 2007/08, 2012/13 and 2017/18. #footnote[The latest survey data for year 2023/24 should be released in mid 2024. This paper will update with the new data once available.]

Each HES surveyed about 13,000 dwelling units in Singapore, and reported both household's income and expenditure data.

Household expenditure and income data segmented by income quintile:
#figure(
  tablex(
    columns: 7,
    align: center + horizon,
    auto-vlines: false,
    [*Year*], [*Data Type*], [*1st-20th*], [*21st-40th*], [*41st-60th*], [*61st-80th*], [*81st-100th*],
    rowspanx(3)[2007/08], [Expenditure], [1,787], [2,950], [3,602], [4,569], [6,138],
    [Income], [1,466], [3,934], [6,175], [9,439], [19,511],
    [LCP], [1.22], [0.75], [0.58], [0.48], [0.31],
    rowspanx(3)[2012/13], [Expenditure], [2,215], [3,531], [4,705], [5,596], [7,575],
    [Income], [1,949], [5,238], [8,355], [12,246], [24,547],
    [LCP], [1.14], [0.67], [0.56], [0.46], [0.31],
    rowspanx(3)[2017/18], [Expenditure], [2,570], [3,753], [4,812], [5,826], [7,573],
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
    rowspanx(2)[*Year*], rowspanx(2)[*Data Type*], colspanx(4)[*HDB*], rowspanx(2)[*Condo*], rowspanx(2)[*Landed*],
    (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room&EC*],(),
    rowspanx(3)[*2007/08*], [Expenditure], [957], [2,121], [3,093], [4,423], [6,587], [8,222],
    [Income], [1,373], [3,946], [5,737], [9,028], [17,176], [21,198],
    [LCP], [0.70], [0.54], [0.54], [0.49], [0.38], [0.38],
    rowspanx(3)[*2012/13*], [Expenditure], [1,287], [2,478], [3,918], [5,283], [8,000], [10,409],
    [Income], [1,855], [5,083], [8,043], [11,006], [20,534], [26,055],
    [LCP], [0.69], [0.49], [0.49], [0.48], [0.39], [0.40],
    rowspanx(3)[*2017/18*], [Expenditure], [1,545], [2,709], [3,933], [5,504], [7,963], [10,500],
    [Income], [2,521], [5,868], [8,827], [12,244], [21,830], [28,937],
    [LCP], [0.51], [0.42], [0.44], [0.43], [0.37], [0.36],
  ),
  kind: table,
  caption: "SG Household income & expenditure by type of dwelling"
) <sg_household_by_dwelling>

These data provides insights about household living cost status in Singapore.

LPC focus on household's monthly all source expenditure and income, aiming to reflect a household's cash flow status, which reflects pressure of living cost. Thus expenditures like imputed rental of owner-occupied accommodation should not be included when calculating expenditure.

Income include from all source that effects household's cash flow, for example salary, investment, rental income and regular government transfers like Workfare Income Supplement @wis.

== Analysis of SG LCPC

LCPC shows how live cost pressure are distributed among a society. LCPC could be segmented using different ways.

=== Segmented by Income Quintile

The most natural way will be segmented with income level. But using income quintile may have unexpected issue.

Quick finding from SG LCPC by income quintile in @sg_lcpc_by_income and @sg_household_by_income:
- LCP decreases as income level increases
- LCPC shift downward from 2007/08 to 2017/18
  - All group faces lesser pressure
- 21th-40th group's LCP drop most significantly
- 81th-100th group's LCP didn't shift much
- 1st-20th group's LCP increase from 2012/13 to 2017/18, indicating this group by face large pressure.

However, the data of 1st-20th group deserve more careful examination:
- LCP is higher than 1, meaning expenditure exceed income, i.e. household is running on deficit.

This status does not necessarily implies that "Singapore's Poor struggles with household deficit". Within this group, 30%+ of household sole non-working household members of age 65+. i.e. retired elderly could be living saving, thus expenditure exceeds income#footnote[Retired elderly has no fixed salary, but could still have income from investment and rental.]. HES report indicates that #quote[It is notable, for example, that some resident households in the lowest 20% owned a car (13.6 per cent), employed a maid (13.9 per cent), lived in private property (7.1 per cent) or were headed by persons aged 65 years and over (36.7 per cent) in 2017/18.], indicating group with low monthly income may not be poorest group.

So, using income quintile for LCPC would be misleading.

=== Segmented by Type of Dwelling

Segmentation by type of dwelling on the other hand as shown in @sg_lcpc_by_dwelling and @sg_household_by_dwelling may better represent wealthiness of a household and its LCP. There is strong corelation between amount of government transfer received and type of dwelling as shown in Key Household Income Trends, 2023 report@income_trend by SingStat and the group of received most government transfer is the one dwell in HDB#footnote[HDB stands for House Development Board, and it's often referred to the public house developed by Singapore government - House Development Board.] 1 & 2 Room flat#footnote[Key Household Income Trends, 2023 Chart 6: Average Annual Government Transfers Per Household Member shows that Government Transfers tends to decrease as type of dwelling improve]. Thus, if we are concerned about status of low class in Singapore, it's better to look at the group stay in HDB 1-2 Room flat, instead of the group having the lowest income.

Type of dwelling in Singapore are typically segmented into:

#figure(
  tablex(
    columns: 8,
    align: center + horizon,
    auto-vlines: false,
    rowspanx(2)[],colspanx(4)[*HDB*], rowspanx(2)[*Condo#footnote[Condominiums & Other Apartments]*], rowspanx(2)[*Landed#footnote[Landed Properties]*],rowspanx(2)[*All*],
    (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room&EC#footnote[Executive Condominiums which sold by HDB, provide better housing but government sponsored.]*],(),
    [Percentage], [7.0%], [17.0%], [31.3%], [22.4%], [17.2%], [4.8%], [100%],
  ),
  kind: table,
  caption: "Resident Households by Type of Dwelling 2023"
) <households>

Uniquely in the world, about 77.8%@dwelling_types of Singaporean household stay in HDB. The remaining household stay in private properties like Condo(17.2% of household) and landed properties(4.8% of household).

It's worth noting that when segmenting by type of dwelling, the proportion of each segment may not be the same. "HDB 4 Room" represents about 31.3% of household, much greater then the bottom 7.0% stays in HDB 1-2 Room.

LCPC doesn't requires size of each segment to be equal, it's more important to make each segments representative. i.e. audience is easier to understand which people belongs to which segments thus create better reference value.

When segmenting by income level, despite the segments are evenly distributed, audience may find it hard to project themselves into corresponding group. One may think they belongs to "middle-income", when while they are actually among the top 20% earners. Or the opposites may also happen.

Segmenting by dwelling type on the other hand, provides a clear cut of who should belong to each segment. The SG LCPC by type of dwelling in @sg_household_by_dwelling has been striped off household with sole member of age 65+ and segmented by household#footnote[It's possible to form another LCPC focusing this group alone, as HES has corresponding data. I will analyze in future study.].

#figure(
  image("data/LCPC_change.png", width: 90%),
  caption: "Change of LCP by type of dwelling from 2007/08 to 2017/18"
) <sg_lcpc_change>

Quick findings from this LCPC:
- All LCP below 1: no household face deficit.
- LCP of all groups drop from 2007/08 to 2017/18, the lower type of dwelling tends to have higher drop in LCP as shown in @sg_lcpc_change.
- LCPC thus become much more "flat" in 2017/18 than in 2012/13, implies social equality has improved.
- HDB 1-2 Room group has the most improvement from 2012/13 to 2017/18, as a result of larger increment in income than expenditure. This could be a result of large transfer payment by the government.
- LCPC of 2017/18 is in a slight "W" shape, which the "middle class" - group staying in HDB 4-Room and 5-Room&EC have larger LCP than the neighboring groups HDB 3-Room and Condo. This may reflects the so-called "Squeezed Middle Class".

=== GST increment

There are many factors would affect LCPC, especially change in government policy. Singapore Government increased GST from 7% to 9% in 2023 and 2024, with 1% increment each year, and it applies to all expenditure of all segments. Assuming Singaporean doesn't change consumption with new GST, i.e. inelastic to price change of 1%; this policy will shift whole LCPC upwards, but the shape remains.

Singapore government does provide "Assurance Package" to help low income families@ap_support cushion the impact of GST increment, thus this policy could potentially further flatten LCPC.

When HER 2022/23 report is available, I will re-visit with the new data to evaluate the impact of GST increment in Singapore.

= Estimation of other LCPC

== Mortgage Repayment

HES's expenditure doesn't include Mortgage Repayment. The housing category expenditure in HES report only includes:
- Housing(Rentals) And Utilities
- Furnishings, Household Equipment And Routine Household Maintenance

I initially tried to include mortgage repayment into household expenditure and make another LCPC. According to HES 2022/23 Information Pamphlet, HES did collect home mortgage repayment data, but these data are never revealed in report. It's not only hard to find statistic for Singaporean's mortgage repayment, but also extreme hard to make reasonable estimation of mortgage repayment.

Mortgage is determined largely at the moment of purchase, and it varies a lot from one household to another. It's hard to estimate which age group of household purchase their first house, nor to mention segmented it by income quintiles or type of dwelling.

Mortgage rate may changes,. But about 80% of Singapore household stays in HDB, and the interest rate of HDB's loans is pegged to +0.1% of interest rate of CPF ordinary account@hdb_interest, which has been 2.5% since July 1999@cpf_interest. Market interest rate may change, but it will be capped to 2.6% - the HDB rates. Condo & landed properties owners may need to take loans from commercial banks, and the rate would have much higher fluctuations. But that only impacts the top 20% high income household. Furthermore, MAS has MRS limit: 30%@tdsr.

If we do a extreme estimation of that all household takes the maximum housing loans, it just discounts LCP of all segment to 70%, and has no impact on the shape of the LCPC.

From an accounting perspective, property is considered as an asset of a household, the purchase of a house is actually just turning cash assets to fixed asset, and may not incur any expenditures. It's sometimes even be considered as an investment. It's only the interest payment of mortgage could be considered as actual expenditure.

Mortgage impact of LCPC would be future research topic, but in this paper, I decide to exclude mortgage repayment when constructing LCPC.

== Rental - LCPC for foreign workers in Singapore

Rental on housing is an area worth deeper analysis. Home ownership rate is almost 90% in Singapore@sg_home_ownership, thus rental may not be a significant factor for Singaporean household's expenditure. But Singapore is a society consisting about 30%, or 1.77M non-residents@sg_population. Furthermore, Singapore forbids foreigner making purchase of HDB and most landed properties, the additional buyer-side stamp duty - ABSD for foreign buyers also has been increasing#footnote[https://www.iras.gov.sg/taxes/stamp-duty/for-property/buying-or-acquiring-property/additional-buyer's-stamp-duty-(absd)]. Most foreign workers in Singapore will need to rental places to stay, and rental is a major factor for their LCP.

It's possible to construct an estimated LCPC for foreign workers in Singapore segmented by the type of work pass for 2023:

#figure(
  image("data/LCPC_foreign.png", width: 80%),
  caption: "ESTIMATED SG LCPC for foreigners by type of work pass"
) <sg_lcpc_by_pass>

Quick findings:
- Work Permit - WP group has LCP very close to 1, implying they are very closed to face deficit or cash flow issues. The minimum WP salary required by MOM may not be sufficient for them to support their life in Singapore. Their monthly expenditure are already closed to the minimum by having expenditures similar to the bottom 7% local, i.e. the group stay in HDB 1-2 Room and they only assumed to share HDB room with another worker. There is not much room to cut expenditure given the ever increasing CPI in Singapore. Thus, the way for WP group to fight with high LCP may  work overtime and get additional income.
- The group estimated to have both lowest LCP(0.56) and highest LCP(1.05) are Employment Pass(EP) holders, depending on the type of housing they rent. Monthly rental is the most significant factor affecting their LCP. Middle class professional considering relocating to Singapore may find living cost unbearable if they want to stay in condo and maintain corresponding life style. But, they would find comfort if they choose to rent HDB and have moderate life style just like the majority of Singaporeans.
- High income professional like Personalized Employment Pass(PEP)/Overseas Networks & Expertise Pass(ONE Pass) holders faces similar LCP below 0.7. They are the target audience of WCOL by EIU. Despite Singapore may have the highest cost of living in the world, the high income of expatriate may make them still find it affordable.

=== Estimation of data

As an estimation, I assume WP, S-Pass(SP) and EP holders are individual bearing only they own expenditure, whereas PEP bear expenditure of a family of 3, and ONE Pass holder bear expenditure of a family of 4. The rentals are estimated from average rental price of HDB 4-Room flat and 3-bedroom condo. I further assume:
- WP holders co-rent one HDB bedroom.
- SP/EP holders rent one bedroom.
- PEP and ONE-Pass holders rent one whole flat.

Monthly expenditure excluding rental are estimated from household expenditure data from HES and CPI. As for income estimation, I use minimum salaries required by Ministry of Manpower for each type of pass. Detailed code for estimations is available on LCPC's github repo#footnote[https://github.com/Wuvist/lcpc].

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

I have published an article@wechat in Chinese describing above estimation of foreign workers in Singapore's expenditure. Up to the moment of writing, this article has received over 3K views and comments leave by viewers confirmed my estimations to be very accurate comparing to their actual expenditure. The viewers indicated themselves from either the EP Rent HDB or EP Rent Condo group.

I used the minimum income for each type of work pass instead of using mean income because I believe it could serve better reference for foreigners considering working in Singapore. The LCP estimated using minimum income will be the best largest, so that potential workers could prepare themselves for the largest living cost pressure they need face if relocate to Singapore.

= LCPC for other economies

The proposed indicator LCPC should be flexible and applicable to economies beyond Singapore. When constructing LCPC for other economies, we must look into the specified characteristics of the economy.

For example, when segmenting by income level, could be applied to other economies without modification, providing household expenditures & income data by income level are available.

As mentioned earlier, segmenting by income level has its pro and cons. And in Singapore's case, segmenting by type of dwelling would provide better insight. When constructing LCPC for other economies, we may need to digest the characteristics of the local societies, and pick representing segmentation. It could be by income level, or by race/ethnic groups etc.

As LCPC for different economies may used different segmentation approach. Comparison of LCPC may not be meaningful. But, LCP as a scalar may be used for comparison among economies.

The shape and movement of LCPC in different period may also be used from cross comparison.

== Comparison with Hong Kong

Hong Kong is an economy once very similar to Singapore. Census and Statistics Department - C&SD in Hong Kong also conducts Household Expenditure Survey once every 5 years. That allows me to construct a similar LCPC for Hong Kong:

#figure(
  image("data/LCPC_hk.png", width: 80%),
  caption: "ESTIMATED HK LCPC by type of housing"
) <hk_lcpc>

#figure(
  image("data/LCPC_hk_without_rent.png", width: 80%),
  caption: "ESTIMATED HK LCPC exclude rent by type of housing"
) <hk_lcpc_without_rent>

C&SD separate type of housing into Public Housing, Subsidised Housing and Private Housing.

Hong Hong's Home Owner Rate is about 51.50% @hk_home_ownership, thus rental payment would be a significant factor when constructing LCPC.

In the latest LCPC for year 2019/20, all 3 groups face similar LCP about 0.64 in 2019/20 when rental are excluded; but when rental is included into expenditure as they should, LCP of the two non-public housing group jump significantly, they are very closed to 1. Implying a much higher living cost pressure if residents in Hong Kong are not able to stay in public housing.

If I'm allowed to do cross comparison of LCP between Singapore and Hong Kong, the LCP of Subsidised Housing group(0.97) is actually higher than SP group in SG LCPC for foreign workers(0.89). This may imply that there is incentive for Hong Kong resident to migrate to work in Singapore, if they could obtained a S-Pass or above.

Similar to Singapore, the LCPC of Hong Kong tends to shift downward from 2009/10 to 2019/20. But, it's import to note that it's only the "rich" and the "poor"'s LCPC decrease significantly in last decade. The middle class - group staying in Subsidised Housing's LCP is almost the same in 2009/10 and 2019/20, indicating their living cost pressure didn't get any better. It's even worse that this group's LCP increased to 1.04 in 2014/15. The "Squeezed Middle Class" effect seems a lot more obvious in Hong Kong.

Unlike Singapore, LCPC of Hong Kong is upward sloping, meaning households in Hong Kong face higher live cost pressure as they get richer and stay in better type of housing. If we exclude rental from expenditure, then LCPC of Hong Kong become similar to Singapore, i.e. downward sloping. Thus, we could safely conclude that rental expenditure is a critical factor impacting living cost prepare of households in Hong Kong.

The fundamental difference here between Hong Kong and Singapore is house ownership rate. Hong Kong's house ownership rate(51.50%) is much lower than Singapore(about 90%). Household in Hong Kong needs to pay rental which is a actual expenditure, whereas household in Singapore may just need to pay for mortgage, which is a form of asset conversion or even investment. This may further implies there will be big difference in the two economies's saving/investment rate, which may have large impact on their GDP growth rate. According to IMF#footnote[International Monetary Fund: https://www.imf.org/external/datamapper/NGDPDPC@WEO/SGP/HKG], Singapore and Hong Kong have very similar GDP per capita at least since 1980s, and it persisted until 2003. In 2023, Hong Kong's GDP per capita is only 58.2% of Singapore. Further growth accounting study of the two economies may confirm or reject this speculation.

=== Data for Hong Kong

Expenditure data for Hong Kong are obtained from Household Expenditure Survey: @hk_expenditure.

However, report of Household Expenditure Survey only includes household's average expenditure data but not income. Thus the income data is obtained from @hk_income. Unfortunately, this income data only reports median income level, but not average#footnote[Whereas Household Expenditure Survey only reports average expenditure, but not median.]. Thus the LCP for Hong Kong are calculated using the ratio between average expenditure over median income. If we assume that average income is higher than median, then these LCP would be lower if using average income, i.e. the whole LCPC may shift downward.

#figure(
  tablex(
    columns: 5,
    align: center + horizon,
    auto-vlines: false,
    [*Year*], [], [*Public Housing*], [*Subsidised Housing*], [*Private Housing*],
    rowspanx(5)[2009\ / \ 2010], [Average Rent], [1,116], [5,969], [9,573],
    [Average Expenditure], [10,569], [19,288], [28,715],
    [Median Income], [10,550], [19,750], [24,250],
    [LCP], [1.00], [0.98], [1.18],
    [LCP exclude Rent], [0.90], [0.67], [0.80],
    rowspanx(5)[2014\ / \ 2015], [Average Rent], [1,576], [8,982], [13,582],
    [Average Expenditure], [13,275], [26,075], [36,728],
    [Median Income], [14,050], [25,000], [31,550],
    [LCP], [0.94], [1.04], [1.16],
    [LCP exclude Rent], [0.83], [0.68], [0.73],
    rowspanx(5)[2019\ / \ 2000], [Average Rent], [1,701], [10,100], [15,218],
    [Average Expenditure], [15,018], [27,631], [37,895],
    [Median Income], [18,250], [28,400], [38,900],
    [LCP], [0.82], [0.97], [0.97],
    [LCP exclude Rent], [0.72], [0.61], [0.58],
  ),
  kind: table,
  caption: "Hong Kong Household expenditure & income by Type of housing"
) <hk_households>

Expenditure#footnote[Included rent] & income data in @hk_households are measured in HKD, no currency conversion are need, as LCP is a ratio which won't be affected by change of currency.

= Conclusion

The main purpose of LCPC is to propose a easy-to-use indicator for living cost pressure measurements. Essentially, LCPC has only two simple idea:
- Take ratio of expenditure and ratio to represent: Living Cost Pressure
- Perform meaningful segmentation to show how pressure is distributed among a economy

As shown in this paper, LCPC would have reference value to varies audiences. Local resident may use LCPC to compare how their living cost pressure other groups or compare with past. Foreign workers may use LCPC to have better understanding of working life in the new place.  Researchers can use LCPC to compare of living cost pressure between economies and find out how live cost pressure of different group response to government policy.

When comparing LCPC of Hong Kong and Singapore, the living cost pressure among different classes and their trends between the two economies are significant. LCPC reveals economic incentive for workers' consideration to relocate and perhaps even major factor driving difference in long term GDP growth.

LCPC's idea is simple but its applications could be very versatile and powerful.

Bottom line, I hope SG's LCPC would serve as a response if WCOL by EIU hits news headline again in future.

All data and source code used for this paper are available at: https://github.com/Wuvist/lcpc

#bibliography("lcpc.bib", style:"harvard-cite-them-right")

#set text(gray)
#set align(right)
#total-words words in total, excluding Section Title / Code / Bibliography.
