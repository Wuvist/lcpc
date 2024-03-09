using CSV, DataFrames, GLM, Plots

# HES: REPORT ON THE HOUSEHOLD EXPENDITURE SURVEY, 2017/18
# data/household_expenditure.pdf

# HES - Chart 1.3: Average Monthly Household Expenditure by Income Quintile2, 2007/08 - 2017/18
e0708 = [1787, 2950, 3602, 4569, 6138]
e1213 = [2215, 3531, 4705, 5596, 7575]
e1718 = [2570, 3753, 4812, 5826, 7573]

# HES - Chart 2.3: Average Monthly Household Income from All Sources1 by Income Quintile2, 2007/08 - 2017/18
i0708 = [1466, 3934, 6175, 9439, 19511]
i1213 = [1949, 5238, 8355, 12246, 24547]
i1718 = [2235, 5981, 9678, 14407, 26587]

LCPC_0708_IQ = e0708 ./ (i0708)
LCPC_1213_IQ = e1213 ./ (i1213)
LCPC_1718_IQ = e1718 ./ (i1718)

plot(LCPC_0708_IQ, xlim=[0.8, 5.2], ylim=[0, 1.3], label="2007/08", title="SG LCPC by Income Quintile",
    ylabel="Monthly LCP(Expenditure/Income)", xlabel="Income Quintile", xticks=([1, 2, 3, 4, 5],
        ["1st-20th", "21st-40th", "41st-60th", "61st-80th", "81th-100th"]))
plot!(LCPC_1213_IQ, label="2012/13")
plot!(LCPC_1718_IQ, label="2017/18")
savefig("data/LCPC_income.png")

# LCPC By dwelling

# HES - Chart 1.8: Average Monthly Household Expenditure by Type of Dwelling, 2007/08 - 2017/18
LCPC_e_0708 = [957, 2121, 3093, 4423, 6587, 8222]
LCPC_e_1213 = [1287, 2478, 3918, 5283, 8000, 10409]
LCPC_e_1718 = [1545, 2709, 3933, 5504, 7963, 10500]

# HES - Chart 2.7: Average Monthly Household Income from All Sources by Type of Dwelling, 2007/08 - 2017/18
LCPC_i_0708 = [1373, 3946, 5737, 9028, 17176, 21198]
LCPC_i_1213 = [1855, 5083, 8043, 11006, 20534, 26055]
LCPC_i_1718 = [2521, 5868, 8827, 12244, 21830, 28937]

LCPC_0708 = LCPC_e_0708 ./ LCPC_i_0708
LCPC_1213 = LCPC_e_1213 ./ LCPC_i_1213
LCPC_1718 = LCPC_e_1213 ./ LCPC_i_1718

plot(LCPC_0708, xlim=[0.8, 6.2], ylim=[0, 1.3], xticks=([1, 2, 3, 4, 5, 6],
        ["1-2 Room", "3-Room", "4-Room", "5-Room&EC", "Condo", "Landed"]), label="2007/08",
    title="SG LCPC by Type of Dwelling", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Type of Dwelling")
plot!(LCPC_1213, label="2012/13")
plot!(LCPC_1718, label="2017/18")
savefig("data/LCPC_dwelling.png")

plot([LCPC_0708[1], LCPC_1718[1]], [6, 6], arrow=2, ylim=[0, 6.5], xlim=[0.3, 0.75], label="", xlabel="LCP")
plot!([LCPC_0708[2], LCPC_1718[2]], [5, 5], arrow=2, label="")
plot!([LCPC_0708[3], LCPC_1718[3]], [4, 4], arrow=2, label="")
plot!([LCPC_0708[4], LCPC_1718[4]], [3, 3], arrow=2, label="")
plot!([LCPC_0708[5], LCPC_1718[5]], [2, 2], arrow=2, label="")
plot!([LCPC_0708[6], LCPC_1718[6]], [1, 1], arrow=2, label="")
yticks!([6, 5, 4, 3, 2, 1], ["1-2 Room", "3-Room", "4-Room", "5-Room&EC", "Condo", "Landed"])
savefig("data/LCPC_change.png")

# Hong Kong
# Expenditure https://www.censtatd.gov.hk/en/web_table.html?id=140-09005
# Table 140-09005 : 2019/20 Household Expenditure Survey - Average Monthly Household Expenditure by Commodity/Service Section/Group by Type of Housing
# "data/Table 140-09005_en.csv"

# Income https://www.censtatd.gov.hk/en/web_table.html?id=130-06613A
# Table 130-06613A : Median monthly household income (excluding Chinese New Year bonus/double pay) by type of housing (excluding foreign domestic helpers)
# "data/Table 130-06613A_en.csv"
hk_e_1920 = [15018, 27631, 37895]

# 2019,Q1,18500,29600,39000,28600
# 2020,Q1,18000,27200,38800,28000
hk_i_21 = [(18500 + 18000) / 2, (29600 + 27200) / 2, (39000 + 38800) / 2]
hk_rent = [1701, 10100, 15218]

LCPC_hk = hk_e_1920 ./ hk_i_21
LCPC_exclude_rent_hk = (hk_e_1920 .- hk_rent) ./ hk_i_21
plot(LCPC_hk, xlim=[0.8, 3.2], ylim=[0, 1.3], xticks=([1, 2, 3],
        ["Public housing", "Subsidised Housing", "Private Housing"]), label="2019/20",
    title="HK LCPC by type of housing", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Type of Housing")
plot!(LCPC_exclude_rent_hk, label="2019/20 exclude rent")
savefig("data/LCPC_hk.png")

# http://www.singstat.gov.sg/whats-new/latest-news/cpi-highlights
# data/cpi_jan24.xlsx
# Sheet 3	Prices and Price Indices	Consumer Price Index (CPI), 2019 As Base Year, Annual
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

e_1room_2019 = alpha_1room + beta_1room * 100
e_4room_2019 = alpha_4room + beta_4room * 100
e_condo_2019 = alpha_condo + beta_condo * 100

# https://www.hdb.gov.sg/residential/renting-a-flat/renting-from-the-open-market/rental-statistics 2023
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
e_EP_Condo = rent_condo_1room + e_condo
e_PEP = rent_condo_2room + e_condo * 3
e_ONE = rent_condo_3room_flat + e_condo * 4

e_WP_2019 = rent_1_HDB_room / 2 + e_1room_2019
e_SP_2019 = rent_1_HDB_room + e_4room_2019
e_EP_hdb_2019 = rent_1_HDB_room + e_4room_2019
e_EP_Condo_2019 = rent_condo_1room + e_condo_2019
e_PEP_2019 = rent_condo_2room + e_condo_2019 * 3
e_ONE_2019 = rent_condo_3room_flat + e_condo_2019 * 4

# min salary requirement
# https://www.mom.gov.sg/passes-and-permits/work-permit-for-foreign-worker/sector-specific-rules/services-sector-requirements
# https://www.mom.gov.sg/passes-and-permits/s-pass/upcoming-changes-to-s-pass-eligibility
# https://www.mom.gov.sg/passes-and-permits/employment-pass/eligibility#ep-qualifying-salary
# https://www.mom.gov.sg/passes-and-permits/personalised-employment-pass/eligibility-and-requirements
# https://www.mom.gov.sg/passes-and-permits/overseas-networks-expertise-pass/eligibility
i_WP = 1600
i_SP = 3150
i_EP_HDB = 5000
i_EP_Condo = 5500
i_PEP = 22500
i_ONE = 30000

LCPC_foreign = [e_WP, e_SP, e_EP_hdb, e_EP_Condo, e_PEP, e_ONE] ./ [i_WP, i_SP, i_EP_HDB, i_EP_Condo, i_PEP, i_ONE]
LCPC_foreign_2109 = [e_WP_2019, e_SP_2019, e_EP_hdb_2019, e_EP_Condo_2019, e_PEP_2019, e_ONE_2019] ./ [i_WP, i_SP, i_EP_HDB, i_EP_Condo, i_PEP, i_ONE]

plot(LCPC_foreign, xlim=[0.8, 6.2], ylim=[0, 1.3], xticks=([1, 2, 3, 4, 5, 6],
        ["WP", "SP", "EP-HDB", "EP-Condo", "PEP", "One Pass"]), label="2023",
    title="ESTIMATED SG LCPC by Type of Work Pass", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Type of Work Pass")
# plot!(LCPC_foreign_2109, label="2019 CPI")
savefig("data/LCPC_foreign.png")
