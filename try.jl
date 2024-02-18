expditures0708 = [1787, 2950, 3602, 4569, 6138]
expditures1213 = [2215, 3531, 4705, 5596, 7575]
expditures1718 = [2570, 3753, 4812, 5826, 7573]


income0708 = [1466, 3934, 6175, 9439, 19511]
income1213 = [1949, 5238, 8355, 12246, 24547]
income1718 = [2235, 5981, 9678, 14407, 26587]

lcmc0708 = expditures0708 ./ income0708
lcmc1213 = expditures1213 ./ income1213
lcmc1718 = expditures1718 ./ income1718

plot(lcmc0708, ylim=[0, 1.5], label="07/08", title="Living Cost Misery Curve", ylabel="Monthly Expenditure / Income", xlabel="Income Quintile", xticks=([1, 2, 3, 4, 5], ["1st-20th", "21st-40th", "41th-60th", "61st-80th", "81th-100th"]))
plot!(lcmc1213, label="12/13")
plot!(lcmc1718, label="17/18")

# by housing type
# expditures0708 = [3180, 957, 2121, 3093, 4423, 6587, 8222]
# expditures1213 = [3831, 1287, 2478, 3918, 5283, 8000, 10409]
# expditures1718 = [3956, 1545, 2709, 3933, 5504, 7963, 10500]
