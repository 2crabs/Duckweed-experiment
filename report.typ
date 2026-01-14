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

#outline(depth: 2)

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

#show image: set align(center)



//END OF SETUP

= Introduction

== Background
#lorem(250)

== Research Question
#lorem(250)


=  Methodology

== Materials

=== Overview
Materials used included
- Olympus E-M5 Mark II Mirrorless Camera
- 12-50mm Lens
- Tripod
- Photo background
- Seachem Flourish Plant Supplement
- Spirodela Polyrhiza (Giant Duckweed)
- LED
- STM32 Devboard
- Black Foamcore

=== Mirrorless Camera
Lighting was consistent across photos taken and all photos were taken using the following settings:

- F
- ISO
- WB
- 1/20
- 16 MP Resolution

=== LED
The LED chosen had the following spectrum

#let (wavelength, percent) = lq.load-txt(read("data/LED-Spectrum.csv"))
#let divide(x) = x*1000000000.0 + 14

#lq.diagram(
  title: [LED Spectrum],
  xlabel: [Wavelength (nm)],
  ylabel: [Relative Power],
  xlim: (380, 780),
  ylim: (0, 100),
  yaxis: (
    format-ticks: lq.tick-format.linear.with(suffix: $%$)
  ),
  width: 150pt,
  height: 80pt,
  lq.plot(wavelength, percent, mark: none, color: rgb(0,175,239), stroke: 1pt, smooth: true)
)

The PCB used for controlling the LED was designed around the following schematic
The LED is controlled using 
#figure(
  image("imgs/schematic.png", width: 150pt),
  caption: [Schematic of LED Driver]
)

//Using a logic MSO oscilloscope to measure the voltage across the current limiting resistor yielded the following curve for turn on speed

=== Plant supplement
Seachem Flourish Plant Supplement was used and contained the following.
#table(
  columns: 2,
  align: (left, center),
  [Total Nitrogen (N)], [0.07%],
  [Available Phosphate ($"P"_2"O"_2$)], [0.01%],
  [Soluble Potash ($"K"_2"O"$)], [0.37%],
  [Calcium (Ca)], [0.14%],
  [Magnesium (Mg)], [0.10%],
  [Sulfur (S)], [0.27%],
  [Boron (B)], [0.008%],
  [Cobalt (Co)], [0.0004%],
  [Copper (Cu)], [0.0001%],
  [Iron (Fe)], [0.32%],
  [Manganese (Mn)], [0.0118%],
  [Molybdenum (Mo)], [0.0009%],
  [Zinc (Zn)], [0.0007%],
)

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