//IMPORTS
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/wordometer:0.1.5": word-count, total-words
//#show: lq.theme.ocean

//TITLE PAGE
#show title: set align(center + horizon)
#show title: set pad(y: 16pt)

#title()[#strike([Effects of Pulsed Lighting on Growth Rate of Spirodela Polyrhiza]) Very Rough Draft]
#v(1.5em)
//#align(center)[M. Fraser]
#show: word-count
#pagebreak()
//END TITLE PAGE

#outline(depth: 2)
//#outline(target: figure.where(kind: image), title: [Figures])
//#outline(target: figure.where(kind: table), title: [Tables])

//PAGE
#set page(
  numbering: "1"
)
#counter(page).update(1)


//HEADINGS
#show heading.where(level: 1): smallcaps
#show heading.where(level: 1): set align(center)

#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.")

#show image: set align(center)

//FIGURES
#show figure.caption: emph
//#show figure.where(kind: table): set figure.caption(position: top)

//FUNC
#let note(body) = {
  set text(red)
  set text(font: "Arial", size: 10pt)
  [#body]
}

//END OF SETUP




= Introduction
#note([Notes in this font and color])

== Background

#note([Likely to change order of ideas but currently Applications->about specific plant-> more detailed about process -> implications. Background is the most incomplete at this point.])

Spirodela Polyrhiza, commonly known as giant duckweed, has gained many uses due to its fast-growing ability and adaptability to a wide range of environments. These features have been especially important in making it the perfect candidate for cleaning urban waste water. Additionally its chemical properties have made it potentially useful for creating biofuel. Being a floating plant has allowed Spirodela Polyrhiza #note([shorten to S. Polyrhiza?]) to be easily handled by automated systems, making it ideal for mechanized processes such as those that might be used for food production.

The plant, measuring under a centimeter in diameter, consists of a frond and root enabling it to efficiently perform photosynthesis on the surface of the water while using the nutrients found below. In certain conditions the plant is able to double biomass in just a few days by using asexual reproduction.

Photosynthesis is a process in which plants are to create food from chemical processes involving carbon dioxide, light energy, and water, a crucial part of their growing process. Previous studies have analyzed the effect of pulsed lighting on lettuce and found that higher frequencies did result in a statistically significant result.
#note([the referenced study has good information about specific relationships between pathways for the materials involved in photosynthesis to include])

PWM modulation is a common technique in controlling lighting brightness, but is often limited to frequencies of up to a few kilohertz. The potential efficiency gained from higher frequencies could allow for power consumption of artifical lighting to be minimized.

#note([End with a specific personal connection? (versus example IAs)])


#note(["research question" probably does not need its own heading])
== Research Question
This exploration will dive into how how rapid digital control of lighting impacts the efficiency of photosynthesis and plant growth. *How does the Frequency of pulsed light effect the growth rate of Spirodela Polyrhiza?*






=  Methodology

== Materials

=== Overview
#note([This section could be converted to a table])
- Camera
- 12-50mm Lens
- Tripod
- Photo background
- Seachem Flourish Plant Supplement
- Spirodela Polyrhiza (Giant Duckweed)
- LED
- STM32 devboard #note([change to just "devboard" or "Controller"])
- Black foam core board
- Temperature sensor
- Humidity sensor
- Plastic cup
- Pipette
- Tap water


=== Camera
An Olympus OM-D E-M5 Mark II mirrorless camera was used with the following settings:

- ISO 1600
- WB Sunlight #note([This will be determined by darktable settings and likely moved to procedure section])
- 1/20
- 16 MP Resolution
- 50mm
- F8

=== LED
The LED chosen had a warmth of 4000k and Color Rendering Inde (CRI) of 90. The spectrum of light emitted is shown in @spectrum.
#v(1em)

#let (wavelength, percent) = lq.load-txt(read("data/LED-Spectrum.csv"))
#let divide(x) = x*1000000000.0 + 14

#figure(
  [
    #lq.diagram(
      xlabel: [Wavelength (nm)],
      ylabel: [Relative Power],
      xlim: (380, 780),
      ylim: (0, 100),
      yaxis: (
        format-ticks: lq.tick-format.linear.with(suffix: $%$)
      ),
      lq.plot(wavelength, percent, mark: none, color: rgb(0,175,239), stroke: 1pt, smooth: true)
    )
    #v(0.5em)
  ],
  caption: [LED Spectrum]
)<spectrum>

#v(1em)

#note([Graphs are embedded as part of the PDF using Lilaq and Typst (everything is Typst). Other example IAs have referenced software used to create graphs but I don't know if that is needed here (because graphs are not created externally)])

The LED was controlled with an N-channel MOSFET and a gate driver as shown in @schematic. The value of R1 was chosen to be 20#sym.Omega.

#figure(
  image("imgs/schematic.png", width: 170pt),
  caption: [Schematic of LED Driver]
) <schematic>

#note([Will add a waveform of the rising edge of voltage across R1])

//Using a logic MSO oscilloscope to measure the voltage across the current limiting resistor yielded the following curve for turn on speed

=== Plant supplement
Seachem Flourish Plant Supplement was used and contains the nutrients required for plant growth as shown in @flourish.
#figure(
  table(
    columns: 2,
    align: (left, center),
    [*Type* #note([or nutrient?])],[*Percent*],
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
  ),
  caption: [Contents of Seachem Flourish]
)<flourish>

#note("should caption be above or below table?")

=== Spirodela Polyrhiza
The plants was acquired at a local aquarium store as part of a larger collection of floating plants that included, duckweed, dwarf water lettuce, and red root floaters #note([will likely replace with scientific names]). Spirodela Polyrhiza was separated and stored at 68#sym.degree in a shallow pool of tap water prior to experiment.

=== Tap water
Tap water was left out in plastic container for a week prior to experiment in order to remove chlorination.


== Procedure
#note([Is it better to add figures in between steps or consolidate them all in one place?])

1. Measure 1500ml of prepared tap water into large container and using a pipette #note([amount still needs to be determined]) add 3 drops of plant supplement into water. Stir the mixture using a metal spoon #note([Does note neccesarily have to be a metal spoon]).
+ Using another pipette add #note([need to determine the optimal volume of fluid here]) 20ml of the mixture prepared in step 1 to a small plastic cup.
+ Repeat step 2 until 18 cups contain water.
+ At random select 18 Spirodela Polyrhiza plants and add them to containers, adding lids with holes #note([reference figure with size and positionting of holes here]).
+ Place containers in a 3 by 6 grid with a spacing of 15 cm between the centers of adjacent containers.
+ Place LED lighting grid above the containers so that lights are centered above plastic cups
+ Set five PWM outputs with a 50% duty cycle and a frequency as determined by @grid. #note([add waveforms to appendix])
+ Measure temperature and humidity
+ After approximately 24 hours remove LED grid and indivually place plastic cups on piece of paper. #note([This piece of paper is printed with a specific pattern that allows for determining area covered by plant through Python])
+ Take photo from directly above paper with the end of lens 70cm above paper. Note time at which photo was taken.
+ Repeat above steps 9 and 10 until five days have passed
#note([Should analysis of photos that yields numerical data be in procedure or results section?])

#figure(
  table(
    columns: 6,
    inset: 2em,
    [Fully On], [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
    [Fully On], [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
    [Fully On], [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
  ),
  caption: [Arrangment of plants]
)<grid>



== Controlled Variables
#note([This could be moved to above procedure])


/*

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

*/
