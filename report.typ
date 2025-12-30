//IMPORTS
#import "@preview/lilaq:0.5.0" as lq

//TITLE PAGE
#show title: set align(center + horizon)
#show title: set pad(y: 16pt)


#title()[Effects of Pulsed Lighting on Growth Rate of Lemina Minor]
#v(1.5em)
#align(center)[M. Fraser]
#pagebreak()
//END TITLE PAGE



//PAGE
#set page(
  columns: 2,
  numbering: "1"
)
#counter(page).update(1)


//HEADINGS
#set heading(numbering: "1.")
#show heading: smallcaps
#show heading: set align(center)


= Introduction
#lorem(250)
$ y = sin x + b $
#lorem(250)

#v(1em)

#let (trig, time, voltage) = lq.load-txt(read("data/test_data.csv"))

#lq.diagram(
  title: [Data test],
  xlabel: [time (s)],
  ylabel: [voltage (v)],
  ylim: (0,4),
  lq.plot(time, voltage, mark: none, color: red)
)

#lorem(240)