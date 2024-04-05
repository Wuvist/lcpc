#import "@preview/tablex:0.0.8": tablex, colspanx, rowspanx

#let c(body) = {
  set text(font: "Microsoft YaHei")
  body
}

#figure(
  tablex(
    columns: 5,
    align: center + horizon,
    auto-vlines: false,
    [*Year*], [], [*#c("公屋")*], [*#c("居屋")*], [*#c("私人楼宇")*],
    rowspanx(5)[2009\ / \ 2010], [#c("平均租金")], [1,116], [5,969], [9,573],
    [#c("平均家庭开支")], [10,569], [19,288], [28,715],
    [#c("家庭收入")], [10,550], [19,750], [24,250],
    [#c("收支压力")], [1.00], [0.98], [1.18],
    [#c("收支压力（扣除租金）")], [0.90], [0.67], [0.80],
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
)
