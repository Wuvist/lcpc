expditures0708 = [1787, 2950, 3602, 4569, 6138]
expditures1213 = [2215, 3531, 4705, 5596, 7575]
expditures1718 = [2570, 3753, 4812, 5826, 7573]

income0708 = [1466, 3934, 6175, 9439, 19511]
income1213 = [1949, 5238, 8355, 12246, 24547]
income1718 = [2235, 5981, 9678, 14407, 26587]

lcmc0708 = expditures0708 ./ (income0708)
lcmc1213 = expditures1213 ./ (income1213)
lcmc1718 = expditures1718 ./ (income1718)

# lcmc0708 = (expditures0708 + loans) ./ income0708
# lcmc1213 = (expditures1213 + loans) ./ income1213
# lcmc1718 = (expditures1718 + loans) ./ income1718

# Loans
# Condo:  4340
# 5room:  2170
# 4room:  1673
# 3room:  1170
# 1room:  585
loans = [585, 1170, 1673, 2170, 4340]

plot(lcmc0708, ylim=[0, 2], label="07/08", title="Living Cost Misery Curve by Household", ylabel="Monthly Expenditure / Income", xlabel="Income Quintile", xticks=([1, 2, 3, 4, 5], ["1st-20th", "21st-40th", "41th-60th", "61st-80th", "81th-100th"]))
plot!(lcmc1213, label="12/13")
plot!(lcmc1718, label="17/18")
savefig("lcmc_household.png")

# by housing type
# expditures0708 = [3180, 957, 2121, 3093, 4423, 6587, 8222]
# expditures1213 = [3831, 1287, 2478, 3918, 5283, 8000, 10409]
# expditures1718 = [3956, 1545, 2709, 3933, 5504, 7963, 10500]
hnumbers = [76961, 240651, 430965, 320330, 207282, 69038]

expend_1213 = CSV.read("expend_201213.csv", header=1:12, DataFrame)
rename!(expend_1213, ["Type of Goods and Services", "Total", "Total HDB", "1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed", "Misc"])
# csv[1:15, 4:9]
e1213 = values(expend_1213[1, 4:9])

e1718 = values(expend_1718[1, 4:9])

income_1213 = CSV.read("income_201213.csv", header=1:12, DataFrame)
# income_1718 = CSV.read("income_201718.csv", header=1:12, DataFrame)
rename!(income1213, ["Source", "Total", "Total HDB", "1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed", "Misc"])
income1213[1:6, 3:9]
i1213 = values(income1213[1, 4:9])
# i1213 = values(income1213[1, 4:9])

mc1213 = collect(e1213 ./ i1213)
mc1718 = collect(e1718 ./ i1718)
plot(mc1213, ylim=[0, 1], xticks=([1, 2, 3, 4, 5, 6], ["1-2 Room", "3-Room", "4-Room", "5-Room and EC", "Condo", "Landed"]), label="12/13", title="Living Cost Misery Curve")
plot!(mc1718, label="17/18")

cpi = [73.741, 74.531, 74.290, 74.854, 76.378, 76.803, 77.572, 79.332, 83.623, 83.176, 85.923, 89.561, 92.662, 94.421, 95.566, 95.658, 95.971, 97.742, 99.067, 100.000, 99.657, 102.197, 108.992]
plot(2000:2022, cpi, label="Consumer Price Index (CPI), 2019 As Base Year")
savefig("cpi.png")
