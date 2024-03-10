// Get Polylux from the official package repository
#import "@preview/polylux:0.3.1": *
#import themes.simple: *
#import "@preview/tablex:0.0.8": tablex, colspanx, rowspanx

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-4-3")
#set text(size: 25pt)
#set quote(block: true)
#set par(
  justify: true,
)

// Use #polylux-slide to create a slide and style it using your favorite Typst functions
#polylux-slide[
  #align(horizon + center)[
    = Living Cost Pressure Curve
    == in Singapore and beyond

    Weng Wei

    Mar 12, 2024
  ]
]

#polylux-slide[
  == Motivation

  "Singapore kept its position as the world’s most expensive city this year, for the ninth time in 11 years." - Economist Intelligence Unit(EIU) Worldwide Cost of Living 2023

  === SG is the most expensive ???
]

#polylux-slide[
  #image("slides/imf.png")
  === SG is the richest ???
]

#polylux-slide[
  = Resource Question

  - How to have quick understanding of living cost pressure in a economy?
  - Existing economic indicator doesn't fit well
    - CPI
    - GDP per capita
    - World Cost Of Living  by EIU
  - Let me come out with a suitable one
]

#focus-slide[
  _Living Cost Pressure_

  $ L C P = (sum "Expenditure")/(sum "Income") $
]

#polylux-slide[
  == LCPC - Living Cost Pressure Curve

  - Calculate LCP for different group in the economy
    - For example: by income
  - construct a curve to show how living cost pressure distributed in the economy
]

#polylux-slide[
  #image("data/LCPC_income.png")
  #uncover(2)[LCP for `1st-20th` group exceed 1 ???]
]

#polylux-slide[
  = Dive into the data
  - Data from Household Expenditure Survey(HES) by SingStat
    - Conducted every 5 years
    - Each Survey about 14,000 dwellings in Singapore

#uncover(2)[#quote["It is notable, for example, that some resident households in the lowest 20% owned a car (13.6 per cent), employed a maid (13.9 per cent), lived in private property (7.1 per cent) or were headed by persons aged 65 years and over (36.7 per cent) in 2017/18." - HES 2017/18]]

  - Low income may not imply poor
  - Elderly aged 65 years and over should be handled separately
]

#side-by-side[
  #set par(
  justify: false,
)
  SG government assume
  - Household in bigger house are richer
][
  #image("slides/transfer.png")
]

#polylux-slide[
  #set par(
    justify: false,
  )
  #grid(
    columns: 2,
    gutter: 5pt,
    [  SG government assume
    - Household in bigger dwelling are richer],
    [#image("slides/transfer.png", width: 80%)]
  )

  #set text(size: 16pt)
    #figure(
    tablex(
      columns: 8,
      align: center + horizon,
      auto-vlines: false,
      rowspanx(2)[],colspanx(4)[*HDB*], rowspanx(2)[*Condo*], rowspanx(2)[*Landed*],rowspanx(2)[*All*],
      (), [*1-2 Room*], [*3-Room*], [*4-Room*], [*5-Room&EC*],(),
      [Percentage], [7.0%], [17.0%], [31.3%], [22.4%], [17.2%], [4.8%], [100%],
    ),
    kind: table,
    caption: "Resident Households by Type of Dwelling 2023"
  ) <households>
]

#polylux-slide[
  #image("data/LCPC_dwelling.png")
  #set text(size: 16pt)
  - Households comprising Solely Non-Working Persons Aged 65 Years and Over are ignored
]

#polylux-slide[
  #set text(size: 20pt)
  === Change of LCP by type of dwelling from 2007/08 to 2017/18
  #image("data/LCPC_change.png")
]

#polylux-slide[
  - All LCP below 1: no household face deficit.
  - LCP of all groups drop from 2007/08 to 2017/18, the lower type of dwelling tends to have higher drop in LCP.
  - LCPC thus become much more "flat" in 2017/18 than in 2012/13, implies social equality has improved.
  - HDB 1-2 Room group has the most improvement from 2012/13 to 2017/18, as a result of larger increment in income than expenditure.
    - This could be a result of large transfer payment by the government.
  - LCPC of 2017/18 is in a slight "W" shape, "middle class squeezed"?
  - Dive deeper into the data...
]

#focus-slide[
  Should expenditure include \
  Mortgage Repayment?
]

#polylux-slide[
  - Mortgage repayment data is hard to find
    - SingStat has it from HES, but never reveal
  - Mortgage repayment is harder to estimate

  - What's buying a house?
    - Turn cash asset into fixed asset
    - It's investment, not expenditure
  - So, NO
]

#focus-slide[
  Should expenditure include rental?
]

#polylux-slide[
  - YES! It's real expenditure.
  - But, not be relevant to Singaporean
    - About 90% house ownership rate
    - Rental is income for Singaporean

  - Crucial for foreigner in SG
    - 2023: 30% or 1.77M non-residents
]

#polylux-slide[
  = LCPC for foreign worker in SG
    - Regress/Forecast/Estimate with CPI & expenditure
    - Estimate income
    - Estimate rental for both HDB & condo
\
\
   #set text(size: 18pt)
    #figure(
      tablex(
        columns: 7,
        align: center + horizon,
        auto-vlines: false,
        rowspanx(2)[], rowspanx(2)[*WP*], rowspanx(2)[*SP*], colspanx(2)[*EP*], rowspanx(2)[*PEP*], rowspanx(2)[*ONE Pass*],
        [*Rent HDB*], [*Rent Condo*],
        [Estimated Expenditure], [1,010], [1,667], [1,667], [3,454], [10,362], [13,816],
        [Estimated Rental#h(28pt)], [562], [1,126], [1,126], [2,328], [4,656], [6,983],
        [Estimated Income#h(24pt)], [1,600], [3,150], [5,000], [5,500], [22,500], [30,000],
        [LCP], [0.98], [0.89], [0.56], [1.05], [0.67], [0.69],
      ),
      kind: table,
      caption: "ESTIMATED SG foreign worker's income & expenditure by type of work pass"
    ) <sg_worker_by_pass>
]

#polylux-slide[
  #image("data/LCPC_foreign.png")
  - Rental HDB or condo?
]


#focus-slide[
  LCPC not just for SG

  Let's look at Hong Kong!
]

#polylux-slide[
  #image("data/LCPC_hk.png")
  - Relocating from HK to SG for smaller living cost pressure?
]

#polylux-slide[
= Conclusion

LCPC has only two simple idea:
- Ratio between expenditure and income: LCP
- LCP for different group, form a curve LCPC

LCPC is simple but versatile.

All data and source code are available at: https://github.com/Wuvist/lcpc
]

#focus-slide[
  SG is expensive? Cite LCPC

  Thank You
]
