using Plots
# using CSV, DataFrame

e0708 = [1787, 2950, 3602, 4569, 6138]
e1213 = [2215, 3531, 4705, 5596, 7575]
e1718 = [2570, 3753, 4812, 5826, 7573]

i0708 = [1466, 3934, 6175, 9439, 19511]
i1213 = [1949, 5238, 8355, 12246, 24547]
i1718 = [2235, 5981, 9678, 14407, 26587]

lcpc_0708_i = e0708 ./ (i0708)
lcpc_1213_i = e1213 ./ (i1213)
lcpc_1718_i = e1718 ./ (i1718)

plot(lcpc_0708_i, xlim=[0.8, 5.2], ylim=[0, 1.3], label="07/08", title="SG LCPC by Income Quintile", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Income Quintile", xticks=([1, 2, 3, 4, 5], ["1st-20th", "21st-40th", "41st-60th", "61st-80th", "81th-100th"]))
plot!(lcpc_1213_i, label="12/13")
plot!(lcpc_1718_i, label="17/18")
savefig("data/LCPC_income.png")

# LCPC By dwelling
LCPC_e_0708 = [957, 2121, 3093, 4423, 6587, 8222]
LCPC_e_1213 = [1287, 2478, 3918, 5283, 8000, 10409]
LCPC_e_1718 = [1545, 2709, 3933, 5504, 7963, 10500]

LCPC_i_0708 = [1373, 3946, 5737, 9028, 17176, 21198]
LCPC_i_1213 = [1855, 5083, 8043, 11006, 20534, 26055]
LCPC_i_1718 = [2521, 5868, 8827, 12244, 21830, 28937]

LCPC_0708 = LCPC_e_0708 ./ LCPC_i_0708
LCPC_1213 = LCPC_e_1213 ./ LCPC_i_1213
LCPC_1718 = LCPC_e_1213 ./ LCPC_i_1718

plot(LCPC_0708, xlim=[0.8, 6.2], ylim=[0, 1.3], xticks=([1, 2, 3, 4, 5, 6], ["1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed"]), label="07/08", title="SG LCPC by type of dwelling", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Type of Dwelling")
plot!(LCPC_1213, label="12/13")
plot!(LCPC_1718, label="17/18")
savefig("data/LCPC_dwelling.png")

# Hong Kong
hk_e_1920 = [15018, 27631, 37895]
hk_i_23 = [19500, 27100, 38700]

LCPC_hk = hk_e_1920 ./ hk_i_23
plot(LCPC_hk, xlim=[0.8, 3.2], ylim=[0, 1.3], xticks=([1, 2, 3], ["Public housing", "Subsidised Housing", "Private Housing"]), label="19/20", title="HK LCPC by type of housing", ylabel="Monthly LCP(Expenditure/Income)", xlabel="Type of Housing")
savefig("data/LCPC_hk.png")

# by housing type
# expditures0708 = [3180, 957, 2121, 3093, 4423, 6587, 8222]
# expditures1213 = [3831, 1287, 2478, 3918, 5283, 8000, 10409]
# expditures1718 = [3956, 1545, 2709, 3933, 5504, 7963, 10500]
# hnumbers = [76961, 240651, 430965, 320330, 207282, 69038]

# expend_1213 = CSV.read("data/expend_201213.csv", header=1:12, DataFrame)
# rename!(expend_1213, ["Type of Goods and Services", "Total", "Total HDB", "1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed", "Misc"])
# e1213 = values(expend_1213[1, 4:9])

# expend_1718 = CSV.read("data/expend_201718.csv", header=1:12, DataFrame)
# e1718 = values(expend_1718[1, 4:9])

# income_1213 = CSV.read("data/income_201213.csv", header=1:12, DataFrame)
# # income_1718 = CSV.read("income_201718.csv", header=1:12, DataFrame)
# rename!(income1213, ["Source", "Total", "Total HDB", "1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed", "Misc"])
# income1213[1:6, 3:9]
# i1213 = values(income_1213[1, 4:9])

# income_1718 = CSV.read("data/income_201718.csv", header=1:12, DataFrame)
# i1718 = values(income_1718[1, 4:9])

# mc1213 = collect(e1213 ./ i1213)
# mc1718 = collect(e1718 ./ i1718)
# plot(mc1213, ylim=[0, 1], xticks=([1, 2, 3, 4, 5, 6], ["1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed"]), label="12/13", title="Living Cost Pressure Curve - by dwelling")
# plot!(mc1718, label="17/18")

# cpi = [73.741, 74.531, 74.290, 74.854, 76.378, 76.803, 77.572, 79.332, 83.623, 83.176, 85.923, 89.561, 92.662, 94.421, 95.566, 95.658, 95.971, 97.742, 99.067, 100.000, 99.657, 102.197, 108.992]
# plot(2000:2022, cpi, label="Consumer Price Index (CPI), 2019 As Base Year")
# savefig("cpi.png")

