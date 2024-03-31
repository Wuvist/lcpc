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
# PSF from https://www.ura.gov.sg/property-market-information/pmiResidentialRentalStatisticsForNonLanded
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
