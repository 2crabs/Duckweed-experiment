//IMPORTS
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/wordometer:0.1.5": word-count, total-words

//TODO
// Write data processing (Darktable, Python w/math, normalizing results if neccesary)
// Write Results (Initials graphs and tables)
// Draw conclusion
// Determine citations
// Appendix (Code, Tables of data)
// 
// Scripts Used (Counting Pixels, )

//TITLE PAGE
#show title: set align(center + horizon)
#show title: set pad(y: 16pt)

#title()[Effects of Pulsed Lighting on Growth Rate of Spirodela Polyrhiza]
#v(1.5em)
//#align(center)[M. Fraser]
#show: word-count
#pagebreak()
//END TITLE PAGE


//OUTLINE

//taken from Mc-Zen
#let appendix(body) = {
  set heading(numbering: "A.1", supplement: [Appendix])
  counter(heading).update(0)
  body
}
#set heading(supplement: [Main])

#show outline.entry: set text(font: "TeX Gyre Adventor", weight: "medium")
#show outline: set text(font: "TeX Gyre Adventor", weight: "medium")


#outline(depth: 2, target: heading.where(supplement: [Main]))
#outline(target: heading.where(supplement: [Appendix], depth: 1), title: [Appendix])
//#outline(target: figure.where(kind: image), title: [Figures])
//#outline(target: figure.where(kind: table), title: [Tables])

// END OOUTLINE

//PAGE
#set page(
  numbering: "1"
)
#counter(page).update(1)


//HEADINGS
//#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set text(font: "TeX Gyre Adventor", weight: "bold")
#show heading.where(level: 2): set text(font: "TeX Gyre Adventor", weight: "medium")
#show heading.where(level: 3): set text(font: "TeX Gyre Adventor", weight: "thin")

#set heading(numbering: "1.")

#show image: set align(center)

//FIGURES
#show figure.caption: emph

//FUNC
// #let note(body) = {
//   set text(red)
//   set text(font: "Arial", size: 10pt)
//   [#body]
// }

#let note(body) = {}

//END OF SETUP
#show heading.where(level: 1): upper

= Introduction
== Background

#note([Likely to change order of ideas but currently Applications->about specific plant-> more detailed about process -> implications. Background is the most incomplete at this point.])

Spirodela Polyrhiza, commonly known as giant duckweed, has gained many uses due to its fast-growing ability and adaptability to a wide range of environments. These features have been especially important in making it the perfect candidate for cleaning urban waste water (citation). Additionally its chemical properties have made it potentially useful for creating biofuel (Citation). Being a floating plant has allowed Spirodela Polyrhiza #note([shorten to S. Polyrhiza?]) to be easily handled by automated growing systems, making it ideal for mechanized processes such as those that might be used for food production.

#figure(
  image("imgs/single-plant.jpg", width: 180pt),
  caption: [Spirodela Polyrhiza plant]
) <figFrond>

The plant, measuring under a centimeter in diameter, consists of a frond and root seen in @figFrond. This enables it to efficiently perform photosynthesis on the surface of the water while using the nutrients found below. In certain conditions the plant is able to double biomass in just a few days by using asexual reproduction(citation).

Photosynthesis is a process in which plants are to create food from chemical processes involving carbon dioxide, light energy, and water, a crucial part of their growing process. (more about the chemical reactions involved in this process).

Predict that higher frequencies will be more effective at growing a plant. This relates to the residual concentration of the products of the chloroplast.

Previous studies have analyzed the effect of pulsed lighting on lettuce and found that higher frequencies did result in a statistically significant result. (What frequencies were tested)

PWM modulation is a common technique in controlling lighting brightness, but is often limited to frequencies of up to a few kilohertz. The potential efficiency gained from higher frequencies could allow for power consumption of artifical lighting to be minimized.

End with a specific personal connection


#note(["research question" probably does not need its own heading])
== Research Question
This exploration will attempt to answer *how does the Frequency of pulsed light effect the growth rate of Spirodela Polyrhiza?*





=  Methodology

== Materials
#note([This section could be converted to a table])
- Camera and Lens
- Tripod
- Photo background
- Seachem Flourish Plant Supplement
- Spirodela Polyrhiza (Giant Duckweed)
- LED Controller PCB
- STM32 devboard #note([change to just "devboard" or "Controller"])
- Black foam core board
- Temperature sensor
- Plastic cup
- Plastic straw
- Tap water


=== Camera
An Olympus OM-D E-M5 Mark II mirrorless camera was used with a 12-50mm lens. The settings used for all photos taken were:

- ISO 1600
- 1/20 Shutter speed
- 16 MP Resolution
- 50mm
- F8

=== LED
The LED chosen had a warmth of 4000k and Color Rendering Index (CRI) of 90. The spectrum of light emitted is shown in @spectrum.
#v(1em)

#let (wavelength, percent) = lq.load-txt(read("data/LED-Spectrum.csv"))

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

The LED was controlled with an N-channel MOSFET and a gate driver as shown in @schematic. The value of R1 was chosen to be 50#sym.Omega allowing $approx 100"mA"$ of current to flow through the LED. Photos of PCB and further information on components used can be found in @appA.

#figure(
  image("imgs/schematic.png", width: 160pt),
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
    [*Nutrient*],[*Percent*],
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
The plants was acquired at a local aquarium store as part of a larger collection of floating plants that included, duckweed, dwarf water lettuce, and red root floaters. Spirodela Polyrhiza was separated and stored at 68#sym.degree C in a shallow pool of tap water prior to experiment.

=== Tap water
Tap water was left out in plastic container for a week prior to experiment in order to remove chlorination.

== Controlled Variables
#note([This could be moved to above procedure])
Explain Why conditions were chosen or why some desired conditions could not be found
- Temperature:
- Water:
- Plant species: Study shows that different water species react differently to temperatures
- Lighting: Same Spectrum


== Procedure
#note([Is it better to add figures in between steps or consolidate them all in one place?])

1. Measure 1000mL of prepared tap water into large container. Using the plastic straw, measure out 0.02ml of the plant supplement. This concentration was found based on the recommended amount of 5ml per 250L. Stir the mixture using the straw.

+ Add 30mL of the mixture prepared in step 1 to a small plastic cup.
+ Repeat step 2 until 15 cups contain water.
+ At random select 30 Spirodela Polyrhiza plants and add two to each of the plastic cups.
+ Place containers in a 3 by 5 grid with a spacing of 10 cm between the centers of adjacent containers.
+ Place LED lighting grid above the containers so that lights are centered above plastic cups
+ Set five PWM outputs with a 25% duty cycle and a frequency as determined by @grid.
+ After 24 hours remove LED grid and individually place plastic cups on piece of paper.
+ Take photo from directly above paper with the end of lens 70cm above paper. Beside the cup place a piece of paper identifying the trial number. See @appB for diagrams.
+ Repeat above steps 8 and 9 until three days have passed.
+ Repeat steps 1 to 10.
#note([Should analysis of photos that yields numerical data be in procedure or results section?])

#figure(
  table(
    columns: 5,
    inset: 2em,
    [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
    [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
    [0.01 Hz], [1 Hz], [100 Hz], [10 KHz], [1 MHz],
  ),
  caption: [Arrangment of plants]
)<grid>

== Safety and Environmental Considerations
The power supply and LED setup were placed in a fireproof enclosure to prevent the ignition of its surroundings due to unexpected heating. This was important, as $"CO"_2$ captured in the wood of my house could have been released into the atmosphere and contributed to global warming.

Additionally, because plants were not taken out of their natural environment, there was not potential for damage to the surrounding ecosystem that Spirodela Polyrhiza would be found in.

== Data Processing
For simplicity the conditions used for frequency will be referred to based on @refer. These are also the meanings of the numbers used in the photos. Additionally Each trial will be referred to with a letter. For each condition there were 6 trials, so thee letters used are A, B, C, D, E, and F.

#figure(
  table(
    columns: 2,
    inset: 1em,
    [Frequency], [Condition #sym.hash],
    [0.01 Hz], [1],
    [1 Hz], [2],
    [100 Hz], [3],
    [10 kHz], [4],
    [1 MHz], [5]
  ),
  caption: [Frequency and matching number]
)<refer>

The experimental procedure resulted in 120 raw image files which were than processed in Darktable to create the images found in @appB. A threshold of ____ was used for isolating red. For isolating green a threshold of ____ was used. All pixels within these thresholds were turned into black pixels while all others were turned into white pixels. The resulting photos with green and red extracted can be found in @appB.
#figure(
  image("imgs/placeholder.jpg", width: 230pt),
  caption: [Histogram of number of red pixels in photos]
) <figRedHist>

Using this we can estimate that x pixels is equivalent mm squared.

Because we know the size of the red square is blank, we are able to convert the area in number of pixels into dimensional units using the following formula:
$ "Area" = ("pixels")/1 dot (x "mm"^2)/( x "pixels") $

This resulted in 
= Results

== Initial Graphs
A total of 120 photos were taken.
Heat map graph for total difference

#let plantDifference = lq.load-txt(read("data/difference.csv"))
#figure(
  lq.diagram(
    width: 5cm, height: 6cm,
    lq.colormesh(
      lq.linspace(1, 5, num: 5),
      lq.linspace(1, 6, num: 6),
      (x, y) => int(plantDifference.at(int(x - 1)).at(int(y - 1))),
      map: color.map.magma
    ),
    yaxis: (
      ticks: range(1, 7).zip(([A], [B], [C], [D], [E], [F]))
    )
  ),
  caption: [1Hz signal used to control LED]
)<appWa>

Initial graphs (Average for each condition line chart (5 colors and 4 datpoints for each))

Box 

== Significance
ANOVA test (significant difference in means)

Mention uncertainty


= Conclusion
What do the results show? Is this data useful in the future. 

= Evaluation
What were the weaknesses. What could be improved.




#pagebreak()

#show: appendix

= Setup and Code <appA>

== Diagrams
#set block(spacing: 3em)
#figure(
  image("imgs/grid.jpg", width: 350pt),
  caption: [Placement of cups on foam core board]
) <appPCB>

#figure(
  image("imgs/middle-section.jpg", width: 350pt),
  caption: [Top and side view of middle section used to raise LEDs and prevent light leakage between plants]
) <appPCB>

#figure(
  image("imgs/light-grid.jpg", width: 350pt),
  caption: [Placement of LED PCBs on foam core board]
) <appPCB>

#figure(
  image("imgs/cup.jpg", width: 220pt),
  caption: [Dimensions of plastic cup]
) <appPCB>

#figure(
  image("imgs/paper.jpg", width: 260pt),
  caption: [Layout for photos]
) <appPCB>
== PCB

#set block(spacing: 3em)

#figure(
  image("imgs/pcb-layout.jpg", width: 280pt),
  caption: [Assembled PCB (left) and PCB layout (right)]
) <appPCB>

PCBs were assembled using lead-free solder paste which was reflowed using a hot plate at 240$degree$C. The three wires were then soldered in the opposite direction as the photo. The components used are shown in @tableComponents.

#figure(
  table(
    columns: 5,
    align: (center, center, center),
    [*Component*], [*Value*], [*Quantity*], [*Manufacturer*], [*Part number*],
    [Capacitor], [$22mu"F"$], [4], [Murata], [GRM21BR61C106KE15L],
    [Resistor], [$49.9 Omega$], [1], [YAGEO], [RC2010FK-0749R9L],
    [LED], [N/A], [1], [Cree LED], [JB3030AWT-P-U40EA],
    [Gate Driver], [N/A], [1], [Infineon], [IRS44273LTRPBF],
    [MOSFET], [N/A], [1], [Good-Ark], [SSF2300],
  ),
  caption: [Components used in LED Controller PCB]
)<tableComponents>

== Waveforms
How oscilloscope was used to acquire waveforms. The waveforms of the LED Anode and MOSFET drain were created using a different supply voltage.

#let (TimeMSO2, Trig2, WAV2) = lq.load-txt(read("data/wav-1Hz_analog.csv"))
#let (TimeMSO3, Trig3, WAV3) = lq.load-txt(read("data/wav-100Hz_analog.csv"))
#let (TimeMSO4, Trig4, WAV4) = lq.load-txt(read("data/wav-10kHz_analog.csv"))
#let (TimeMSO5, Trig5, WAV5) = lq.load-txt(read("data/wav-1MHz_analog.csv"))

#let (TimeMSOGate, TrigGate, vGate) = lq.load-txt(read("data/MOSFET-Gate_analog.csv"))
#let (TimeMSODrain, TrigDrain, vDrain) = lq.load-txt(read("data/MOSFET-Drain_analog.csv"))
#let (TimeMSOAnode, TrigAnode, vAnode) = lq.load-txt(read("data/resistor-d-side_analog.csv"))

#figure(
  lq.diagram(
    lq.plot(
      TimeMSO2.map(x => x*100), WAV2,
      mark: none,
    ),
    xlabel: [Time (s)],
    ylabel: [IN (V)],
    title: [0.01Hz],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [0.01Hz signal used to control LED]
)<appWave1>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSO2, WAV2,
      mark: none,
    ),
    xlabel: [Time (s)],
    ylabel: [IN (V)],
    title: [1Hz],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [1Hz signal used to control LED]
)<appWave2>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSO3.map(x => x*1000), WAV3,
      mark: none,
    ),
    xlabel: [Time (ms)],
    ylabel: [IN (V)],
    title: [100Hz],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [100Hz signal used to control LED]
)<appWave3>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSO4.map(x => x*1000*1000), WAV4,
      mark: none,
    ),
    xlabel: [Time ($mu$s)],
    ylabel: [IN (V)],
    title: [10kHz],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [10kHz signal used to control LED]
)<appWave4>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSO5.map(x => x*1000*1000), WAV5,
      mark: none,
    ),
    xlabel: [Time ($mu$s)],
    ylabel: [IN (V)],
    title: [1MHz],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [1MHz Waveform]
)<appWave5>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSOGate.map(x => x*1000*1000*1000), vGate,
      mark: none,
    ),
    xlabel: [Time (ns)], 
    ylabel: [Gate Voltage (V)],
    title: [MOSFET Gate],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [Rise and fall of voltage on MOSFET gate]
)<appWaveGate>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSODrain.map(x => x*1000*1000*1000 + 265), vDrain,
      mark: none,
    ),
    xlabel: [Time (ns)],
    ylabel: [Drain Voltage (V)],
    title: [MOSFET Drain],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [Rise and fall of voltage on MOSFET drain]
)<appWaveDrain>

#figure(
  lq.diagram(
    lq.plot(
      TimeMSOAnode.map(x => x*1000*1000*1000 + 265), vAnode,
      mark: none,
    ),
    xlabel: [Time (ns)],
    ylabel: [LED Anode Voltage (V)],
    title: [LED Anode],
    width: 450pt,
    legend: (position: bottom + right)
  ),
  caption: [Rise and fall of voltage on LED anode]
)<appWaveAnode>

== Code

== Software



#pagebreak()
= Duckweed Photos and Pixel Count <appB>



//DATA TABLES
#{

  let arrayToTable(array) = {
    return table(
      columns: 7,
      [t], [A], [B], [C], [D], [E], [F],
      [0], ..(array.at(0)),
      [1], ..(array.at(1)),
      [2], ..(array.at(2)),
      [3], ..(array.at(3))
    )
  }

  let tablesToColumn(table1, table2, freq) = {
    columns(2)[
      #figure(
        table1,
        caption: [Green Pixels for #freq]
      )<grd>
      #colbreak()
      #figure(
        table2,
        caption: [Red Pixels for #freq]
      )<grd>
    ]
  }

  let g1 = csv("data/10mHz-g.csv")
  let r1 = csv("data/10mHz-r.csv")
  let g2 = csv("data/1Hz-g.csv")
  let r2 = csv("data/1Hz-r.csv")
  let g3 = csv("data/100Hz-g.csv")
  let r3 = csv("data/100Hz-r.csv")
  let g4 = csv("data/10kHz-g.csv")
  let r4 = csv("data/10kHz-r.csv")
  let g5 = csv("data/1MHz-g.csv")
  let r5 = csv("data/1MHz-r.csv")

  v(10pt)
  tablesToColumn(arrayToTable(g1), arrayToTable(r1), [0.01Hz])
  tablesToColumn(arrayToTable(g2), arrayToTable(r2), [1Hz])
  tablesToColumn(arrayToTable(g3), arrayToTable(r3), [100Hz])
  tablesToColumn(arrayToTable(g4), arrayToTable(r4), [10kHz])
  tablesToColumn(arrayToTable(g5), arrayToTable(r5), [1MHz])
  pagebreak()
}

//PHOTOS
// #{
//   let photos() = {
//     let times = ("0", "1", "2", "3")
//     let conditions = ("1", "2", "3", "4", "5")
//     let trials = ("A", "B", "C", "D", "E", "F")
//     let result = ()

//     for condition in conditions{
//       for trial in trials{
//         for time in times{
//           let path = "Duckweed-photos/"
//           let base = "Base/"
//           let green = "Green/"
//           let red = "Red/"
//           let file = condition + trial + "_" + time + ".jpg"
//           result.push(image(path + base + file))
//           result.push(image(path + green + file))
//           result.push(image(path + red + file))
//         }
//       }
//     }

//     return result
//   }

//   [
//     #table(
//       columns: 3,
//       align: center,
//       [*Original*], [*Green Extracted*], [*Red Extracted*],
//       ..photos()
//     )
//   ]
// }
