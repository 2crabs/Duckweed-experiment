//IMPORTS
#import "@preview/lilaq:0.5.0" as lq

//TITLE PAGE
#show title: set align(center + horizon)
#show title: set pad(y: 16pt)

#title()[Effects of Pulsed Lighting on Growth Rate of Spirodela Polyrhiza]
#v(1.5em)
#align(center)[M. Fraser]
#pagebreak()
//END TITLE PAGE

#outline()

//PAGE
#set page(
  columns: 2,
  numbering: "1"
)
#counter(page).update(1)


//HEADINGS
#set heading(numbering: "1.")
#show heading.where(level: 1): smallcaps
#show heading.where(level: 1): set align(center)


= Introduction

== Background
#lorem(250)

== Research Question
#lorem(250)


=  Methodology

== Materials
#lorem(80)
#v(0.5em)
- Item 1
- Item 2
- Item 3
- Item 4

== Set up
#lorem(350)

$ 1/n dot sum_(k=0)^n x_n = "avg" $


= Results

== Qualitative Data
#lorem(50)

== Quantitative Data
#lorem(70)

#let (trig, time, voltage) = lq.load-txt(read("data/test_data.csv"))
#let divide(x) = x*1000000000.0 + 14

#lq.diagram(
  title: [Data test],
  xlabel: [time (ns)],
  ylabel: [voltage (v)],
  legend: (position: top + right),
  ylim: (0,4),
  lq.plot(time.map(divide), voltage, mark: none, color: red, stroke: 1pt, label: [Reset])
)


= Conclusion
#lorem(370)

= Evaluation

#lorem(300)