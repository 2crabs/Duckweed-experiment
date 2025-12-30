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

#lq.diagram(
  title: [Graph],
  xlabel: [$x$],
  ylabel: [$y = f (x)$],
  lq.plot((0, 1, 2, 3, 4), (3, 5, 4, 2, 3))
)

#lorem(240)