//IMPORTS
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/wordometer:0.1.5": word-count, total-words
#import "@preview/codelst:2.0.2": sourcecode, sourcefile

//TODO
// Introduction discuss processes and chemical reaction used in photosynthesis
// what is photosynthesis -> Light's role in photosynthesis -> chemical formulas -> Prediction
// Write connection to previous study with lettuce plant
// Write personal connection (seeing the worlds of technology and biology collide in a wolrd where that is bbecomeing increasingly more important)
// Explain why specific LED was chosen
// Detail reason for controlling control variables referencing previous study
// Obtain thresholds used for data processing
// Obtain error from histogram for using a camera
// Detail out qualitivative results
// Discuss reason for using heatmap
// Interpret Heatmap
// Reason for using line graph
// Interpret line graph
// Reason for boxplot
// interpret box plot
// State reason for using ANOVA
// state hypothesis
// Interpret significance value
// talk about uncertainty in contributing to result of ANOVA
// Conclusion (where data could be used in future)
// Discussion of number of trials (more trials reduces variability)
// Discussion of precision of instruments used
// Lighting in testing for significance might have effected results
// 
//TITLE PAGE
#show title: set align(center + horizon)
#show title: set pad(y: 16pt)

#title()[Effects of Pulsed Lighting on Growth Rate of Spirodela Polyrhiza]
#v(1.5em)
#align(center)[#total-words]

#show: word-count.with(exclude: ("heading", "table", "caption", "figure", outline, sourcefile))
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

== Research Question
This exploration will attempt to answer *how does the frequency of pulsed light effect the growth rate of Spirodela Polyrhiza?*

== Background

Spirodela Polyrhiza, commonly known as giant duckweed, has gained many uses due to its fast-growing ability and adaptability to a wide range of environments. These features have been especially important in making it the perfect candidate for cleaning waste water (citation). Additionally its chemical properties have made it potentially useful for creating biofuel (Citation). Being a floating plant allows S. Polyrhiza to be easily handled by automated growing systems, making it ideal for mechanized processes such as those that might be used for food production.

#figure(
  image("imgs/single-plant.jpg", width: 180pt),
  caption: [Spirodela Polyrhiza plant]
) <figFrond>

The plant, measuring under a centimeter in diameter, consists of a frond and root which can be seen in @figFrond. This enables it to perform photosynthesis on the surface of the water while obtaining nutrients found below. Using asexual reproduction, S. Polyrhiza is able to quickly reproduce and spread across the surface of calm bodies of water. In ideal conditions the plant has been found to be able to double in size is just a few days.

Photosynthesis in combination with usage of nutrients in the water gives  S. Polyrhiza its fast-growing properties. In photosynthesis plants are to create food from carbon dioxide, light energy, and water, allowing for plant growth. An unbalanced equation for this is shown below:

$ "CO"_2 + "H"_2"O" + "Light energy"arrow "C"_6"H"_12"O"_6 + "O"_2 $

This process occurs in the chloroplast, a plant cell organelle, and is split into two parts. The first of these is light dependent, meaning that it will only occur when light is present. This process uses water and light energy to produce ATP and NADPH. The equation is shown below:

$ "H"_2"O" + "Light energy" arrow "O"_2 + "ATP" + "NADPH" $

The second is light independent, meaing that it can still happen when the plant is not exposed to light. In this reaction the ATP and NADPH from the previous reaction is used with Carbon Dioxide to produce Glucose. The equation is shown below:


$ "C""O"_2 +  "ATP" + "NADPH" arrow "C"_6"H"_12"O"_6 $

Compared to first reaction, this requires more time before and after having the necessary products to slow down or speed up. This is due to photosynthetuc induction and the rate at which the plant can take in Carbon dioxide from the air. When these two reactions are combined they create the simplified model of photosynthesis shown in the first reaction. A diagram depicting this is shown in @figReactions.

#figure(
  image("imgs/reactions.png", width: 180pt),
  caption: [Spirodela Polyrhiza plant]
) <figReactions>

Normally photosynthesis occurs in constant lighting from the sun, but increasingly, plants are  being grown in artificial lighting. Often artificial lighting employs Pulse Width Modulation to control the brightness. This means that lights are quickly turned on and off to make it appear dimmer. This can play a role in plant growth and as duckweed becomes an option for waste water treatment it is necessary to understand the optimal growing conditions, including how it is lit.

Due to the concentration of the reactants in the light dependent reaction being high and products being low in concentration I predict that the when a chloroplast is first exposed to light the light dependent stage of photosyntheis will be more efficient. Additionally after the light is turned off there will be residual products from the reaction to fuel the Calvin Cycle. This is shown in @figPrediction. I hypothesize that as lighting frequency is increased the growth rate of S. Polyrhiza will also increase due to there being more time spent in the region of higher efficiency.

#figure(
  image("imgs/prediction.jpg", width: 400pt),
  caption: [Spirodela Polyrhiza plant]
) <figPrediction>

Previous studies have analyzed the effect of pulsed lighting on lettuce and found that higher frequencies did result in increased growth when compared to lower frequencies of light. This effect was found to be most pronounced in frequencies above 1kHz.

This topic is important to me as it connects the increasingly important world of technology with the world of biology. For example, automated systems are able to effectively grow plants in hydroponic systems. This experiment connects my interest in electronics with my disdain for biology.


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

The accuracy of using a camera will later be identified during data processing.

=== LED
The LED chosen had a warmth of 4000k and Color Rendering Index (CRI) of 90. The spectrum of light emitted is shown in @spectrum. (Why this warmth of LED, Relate to absorption spectrum)
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

#figure(
  image("imgs/all-plants.jpg", width: 230pt),
  caption: [Spirodela Polyrhiza plants used in experiment]
) <figPool>


=== Tap water
Tap water was obtained from the faucet and was left out in plastic container for a week prior to experiment in order to remove chlorination.

== Controlled Variables
- *Temperature*: The optimal temperature for S. Polyrhiza is 25C, but a temperature of 20C was used to due to limitations in the experimental setup.
- *Water*: The water and nutrients in the water were kept the same. Based on previous studies of Duckweed plants the content of Nitrogen and Phosphorous in water can play a large role in growth rate.
- *Plant species*: Study shows that different water species of duckweed have different growth rates so only S. Polyrhiza was used.
- *Lighting*: Due to the importance of the absorption spectrum in plant growth, all plants were exposed to the same wavelengths and intensity of light.


== Procedure

1. Measure 1000mL of prepared tap water into large container. Using the plastic straw, measure out 0.02ml of the plant supplement. This concentration was found based on the recommended amount of 5ml per 250L. Stir the mixture using the straw.

+ Add 30mL of the mixture prepared in step 1 to a small plastic cup.
+ Repeat step 2 until 15 cups contain water.
+ At random select 30 Spirodela Polyrhiza plants and add two to each of the plastic cups.
+ Place containers in a 3 by 5 grid with a spacing of 10 cm between the centers of adjacent containers. Comprehensive diagrams of this setup can be found in @appA.
+ Place LED lighting grid above the containers so that lights are centered above plastic cups
+ Set five PWM outputs with a 25% duty cycle and a frequency as determined by @grid.
+ After 24 hours remove LED grid and individually place plastic cups on piece of paper.
+ Take photo from directly above paper with the end of lens 70cm above paper. Beside the cup place a piece of paper identifying the trial number. See @appA for diagrams.
+ Repeat above steps 8 and 9 until three days have passed.
+ Repeat steps 1 to 10 to have six trials for each frequency condition in order to account for variability in results.

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

#figure(
  grid(
    columns: 2, gutter: 20mm,
    image("imgs/Pixel1.jpg", width: 250pt),
    image("imgs/Pixel2.jpg", width: 250pt),
  ),
  caption: [Grid of cups and lights in fireproof enclosure]
) <figPol>

== Safety and Environmental Considerations
The power supply and LED setup were placed in a fireproof enclosure to prevent the ignition of its surroundings due to unexpected heating. This was important, as $"CO"_2$ captured in the wood of my house could have been released into the atmosphere and contributed to global warming.

Additionally, because plants were not taken out of their natural environment, there was not potential for damage to the surrounding ecosystem that Spirodela Polyrhiza would be found in.

No humans or animals were experimented on during this experiment.

== Data Processing
For simplicity the conditions used for frequency will be referred to based on @refer. These are also the meanings of the numbers used in the photos. Additionally Each trial will be referred to with a letter. For each condition there were 6 trials, so the letters used are A, B, C, D, E, and F.

#figure(
  table(
    columns: 3,
    inset: 1em,
    [Variable], [Frequency], [Referenced As],
    [$f_1$], [0.01 Hz], [1],
    [$f_2$], [1 Hz], [2],
    [$f_3$], [100 Hz], [3],
    [$f_4$],  [10 kHz], [4],
    [$f_5$], [1 MHz], [5]
  ),
  caption: [Frequency and matching reference]
)<refer>

The experimental procedure resulted in 120 raw image files which were than processed in Darktable to create the images found in @appB. A threshold of 0-61 was used for isolating red. For isolating green a threshold of 86-172 was used. All pixels within these thresholds were turned into black pixels while all others were turned into white pixels. The resulting images with green and red extracted can be found in @appB.

Because the tripod likely had small changes in height the lens was a different distance from the paper. This resulted in the red square appearing a different size, and thus a different number of red pixels. Based on the variability in read pixels we are able to determine that the areas acquired from the photos have an error +- 3%.

#let redHistData= lq.load-txt(read("data/red-hist.csv"))
#let redAreas = lq.load-txt(read("data/red-areas.csv")).flatten()


#let rotatedNumbers = ("27000", "27200", "27400", "27600", "27800", "28000", "28200", "28400", "28600").map(rotate.with(-90deg, reflow: true))


#figure(
  grid(columns: 2, gutter: 40pt,
    lq.diagram(
      xaxis: (
        ticks: (
          (27000, rotatedNumbers.at(0)),
          (27200, rotatedNumbers.at(1)),
          (27400, rotatedNumbers.at(2)),
          (27600, rotatedNumbers.at(3)),
          (27800, rotatedNumbers.at(4)),
          (28000, rotatedNumbers.at(5)),
          (28200, rotatedNumbers.at(6)),
          (28400, rotatedNumbers.at(7)),
          (28600, rotatedNumbers.at(8))
          ),
        subticks: none
      ),
      lq.bar(
        redHistData.at(0).map(x=> x+100),
        redHistData.at(1),
        width: 204.0
      ),
      lq.line(
        stroke: (paint: lq.color.map.petroff10.at(1)),
        (27704, 0%), (27704, 100%)
      ),
      lq.line(
        stroke: (paint: lq.color.map.petroff10.at(1), dash: "dashed"),
        (27144, 0%), (27144, 100%)
      ),
      lq.line(
        stroke: (paint: lq.color.map.petroff10.at(1), dash: "dashed"),
        (28409, 0%), (28409, 100%)
      ),
      xlabel: [Pixels],
      ylabel: [Occurrences],
      title: [Red pixels measured]
    ),
    align(center + horizon)[
      #table(
        columns: 2,
        [*Min*], [#calc.min(..redAreas)],
        [*Mean*], [#{calc.round(redAreas.sum()/redAreas.len())}],
        [*Max*], [#calc.max(..redAreas)],
      )
    ]
  ),
  caption: [Histogram and summary of number of pixels in $900 "mm"^2$ red square],
  kind: image
)

Using the mean, we are able to estimate that 27704 pixels is equivalent area of the red square. Because we know the size of the red square is 30mm x 30mm, thus an area of 900mm^2. Using this information, we are able to convert the area in number of pixels into dimensional units using the following formula:

$ "Area" = ("pixels")/1 dot (900 "mm"^2)/(27704 "pixels") $

Using this equation, all measurements of pixels were transformed to measurements in mm^2. The results of these calculations can be found in @appB.

= Results
== Qualitative
After three days had passed under the PWM lighting plants under different frequencies appeared very similar. All had a bright slightly yellow green color. Additionally the area covered by the fronds did not appear to be dramatically larger. Small roots were found at the bottom of the plastic cup having seperated from the frond.

== Initial Data Visualization
Heat map graph for total difference in the area overed by the plant. Again the frequency increases going to the right.

A color mesh style graph was created to show the total change from t=0 to t=72hr. Due to changes in starting area an additional visuallization was created to show the percentage change over the course of the three days. These data visualizations can be found in @figMesh.

#let plantDifference = lq.load-txt(read("data/difference-area.csv"))
#let plantDifferencePercent = lq.load-txt(read("data/percentage-difference.csv"))

#let meshRaw = lq.colormesh(
        lq.linspace(1, 5, num: 5),
        lq.linspace(1, 6, num: 6),
        (x, y) => int(plantDifference.at(int(x - 1)).at(int(y - 1))),
        map: color.map.magma
      )

#let meshPercent =  lq.colormesh(
          lq.linspace(1, 5, num: 5),
          lq.linspace(1, 6, num: 6),
          (x, y) => plantDifferencePercent.at(int(x - 1)).at(int(y - 1)),
          map: color.map.magma
        )

#figure(
  grid([
      #lq.diagram(
        width: 5cm, height: 6cm,
        meshRaw,
        yaxis: (
          ticks: range(1, 7).zip(([A], [B], [C], [D], [E], [F]))
        ),
        title: [Area Change],
        xlabel: [Frequency condition],
        ylabel: [Trial]
      )
      #h(1mm)
      #lq.colorbar(
        meshRaw,
        thickness: 2mm,
        yaxis: (
          position: right,
          format-ticks: lq.tick-format.linear.with(suffix: $"mm"^2$)
        )
      )
    ],
    [
      #lq.diagram(
        width: 5cm, height: 6cm,
        meshPercent,
        yaxis: (
          ticks: range(1, 7).zip(([A], [B], [C], [D], [E], [F]))
        ),
        title: [Percentage Change],
        xlabel: [Frequency condition],
        ylabel: [Trial]
      )
      #h(1mm)
      #lq.colorbar(
        meshPercent,
        thickness: 2mm,
        yaxis: (
          position: right,
          format-ticks: lq.tick-format.linear.with(suffix: $%$)
        )
      )
    ],
    columns: 2,
    gutter: 20pt
  ),
  caption: [Visualization of the change in area (left) and percentage change (right) over the three days of plant growth]
)<figMesh>

There does not appear to be any strong relationship and larger variablilty in amount grown. Despite this the condition for frequency that appears to have grown the least does appear to be the lowest frequency at 0.01Hz.

The color mesh shown in @figMesh only uses the first and last data but we are able to plot the data acquired from the times in between also. The change in area relative the the starting area for each frequency resulted in graph shown in @figLine.

#let times = (0,1,2,3)
#let lineData = lq.load-txt(read("data/line-graph-data-offset.csv"))

#figure(
  lq.diagram(
    lq.plot(
      times,
      lineData.at(0),
      label: [0.01Hz]
    ),
    lq.plot(
      times,
      lineData.at(1),
      label: [1Hz]
    ),
    lq.plot(
      times,
      lineData.at(2),
      label: [100Hz]
    ),
    lq.plot(
      times,
      lineData.at(3),
      label: [10kHz]
    ),
    lq.plot(
      times,
      lineData.at(4),
      label: [1MHz]
    ),
    legend: (position: top + left),
    xlabel: [time (days)],
    ylabel: [Area ($"mm"^2$)]
  ),
  caption: [Average plant coverage by Spirodela Polyrhiza relative to starting point]
)<figLine>

This graph show a more clear pattern of growth in all frequencies except 0.01Hz. Notably from day 2 to  all frequencies appear to have about the same amount of growth.

#let areaDifference = lq.load-txt(read("data/difference-area.csv"))

#figure(
  lq.diagram(
    lq.boxplot(
      areaDifference.at(0),
      areaDifference.at(1),
      areaDifference.at(2),
      areaDifference.at(3),
      areaDifference.at(4)
    ),
    xlabel: [frequency],
    ylabel: [Area Change ($"mm"^2$)]
  ),
  caption: [Comparison of change in area for each frequency]
)<figBar>

To better visuallize the variably across trials a bbar plot was constructed for each frequency. This is shown in @figBar. All bars overlap, indicating a weak relationship between frequency and growth rate.

== Significance
We are comparing five groups, each with six trials. we want to determine if there is a statistically significant difference between these groups so we will an ANOVA test. The null and alternative hypothesis are stated below.

$ H_0: "All means are the same" $
$ H_a: "At least one of the means is different" $

We will use a significane level of p=0.05.

A Python script was used to perform the ANOVA test. This resulted in a p-value of p=0.171. Because this is higher than our significance level of 0.05 we are not able to reject out null hypthesis. We do not have significant evidence that one of the means is different.

The uncertainty of +-3% would not change this result as it would only increase the uncertainty.


= Conclusion
Using an ANOVA test and a significance value we . This the results of this expeirment did not yield eveidence that frequency of lighting changes the growth rate of S Polyrhiza. Despite this the frequency that resulted in the lowest average growth across trials was 0.01Hz, potentially indicating potential for future studies.

The wide range of frequencies used did allow for the possiblity to see the change between any two conditions.

= Evaluation
This experiment did face certain limitations which likely contributed to variabilty in the data acquired. One of the most important was the temperature at which the plants were grown at. The thermometer that was placed in the same enclosure as the plants was checked each time the plants were removed and often displayed 18C. Based on the study of optimal conditions for S Polyrhiza, this likely to a far lower growth rate, demonstrated in two trials even having negative growth.

Additionally the time to collect data was limited resulting in the three day time period that was used. The intensive data collection that neccesitated a photo of each plant limited the sustainability of using the same procedure for longer time periods.

The reliablity of using photos and extracting the green areas was less than expected. Often ambient reflections would cause white specks on plant in the photos resulting in the pixel not being recognized as green. A consistent lighting set up was used, but small changes in the position of the paper and tipod relative to the light did limit the reproducability of the lighting.

Lots of effort did go into the construction of the lighting grid which did work functuion correctly through the entire course of experiment. Despite this, the orginal intentions was to supply each LED controller PCB with 5V instead of 12V, but I was forced. This resulted to only being to use a 50 ohm resistor with 100mA of current. Ideally, a lower brightness of the LED would have been used.

In future studies a longer time period could be used with automated data collection using a camera. This would allow for consistent lighting and results that were more independent of the resolution limitations in a photo. Additionally all the plants could be placed in the same tank of water to ensure that they all have eaccess to the same concentration of nutrients required for growth. Similarly the environment could have been better controlled to maintain optimal temperature and humidity for plant growth. A possible implmentation for this could a heating mat underneath the plants.






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

#show heading.where(level: 3): set heading(numbering: none)

#pagebreak()
== Code

=== anova.py
#sourcefile(read("python-scripts/anova.py"), lang: "py")
This script was used to find the p-value using an ANOVA test.
#pagebreak() 

=== histogram.py
#sourcefile(read("python-scripts/histogram.py"), lang: "py")
This script was used to generate the histogram data for red areas.
#pagebreak()

=== difference.py
#sourcefile(read("python-scripts/difference.py"), lang: "py")
This script was used
#pagebreak()

=== image-analysis-green.py
#sourcefile(read("python-scripts/image-analysis-green.py"), lang: "py")
This script was used
#pagebreak()

=== image-analysis-red.py
#sourcefile(read("python-scripts/image-analysis-red.py"), lang: "py")
This script was used
#pagebreak()

=== line-graph-offset.py
#sourcefile(read("python-scripts/line-graph-offset.py"), lang: "py")
This script was used
#pagebreak()

=== pixel-to-area.py
#sourcefile(read("python-scripts/pixel-to-area.py"), lang: "py")
This script was used
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



  let area1 = csv("data/10mHz-g-area.csv")
  let area2 = csv("data/1Hz-g-area.csv")
  let area3 = csv("data/100Hz-g-area.csv")
  let area4 = csv("data/10kHz-g-area.csv")
  let area5 = csv("data/1MHz-g-area.csv")

  let tablesToColumnAreas(table1, table2, freq1, freq2) = {
    columns(2)[
      #figure(
        table1,
        caption: [Area for #freq1]
      )<grd>
      #colbreak()
      #figure(
        table2,
        caption: [Area for #freq2]
      )<grd>
    ]
  }

  let arrayToTable(array) = {
    return table(
      columns: 7,
      [t], [A], [B], [C], [D], [E], [F],
      [0], ..(array.at(0).map(x => [#x $"mm"^2$])),
      [1], ..(array.at(1).map(x => [#x $"mm"^2$])),
      [2], ..(array.at(2).map(x => [#x $"mm"^2$])),
      [3], ..(array.at(3).map(x => [#x $"mm"^2$]))
    )
  }

  figure(
    arrayToTable(area1),
    caption: [Areas for 0.01Hz]
  )

  figure(
    arrayToTable(area2),
    caption: [Areas for 1Hz]
  )

  figure(
    arrayToTable(area3),
    caption: [Areas for 100Hz]
  )

  figure(
    arrayToTable(area4),
    caption: [Areas for 10kHz]
  )

  figure(
    arrayToTable(area5),
    caption: [Areas for 1Mhz]
  )

  let averageDifference = csv("data/line-graph-data-offset.csv")
  figure(
    table(
      columns: 6,
      [t], [0.01Hz], [1Hz], [100Hz], [10kHz], [1MHz],
      [0], ..averageDifference.at(0).map(x => [#x $"mm"^2$]),
      [1], ..averageDifference.at(1).map(x => [#x $"mm"^2$]),
      [2], ..averageDifference.at(2).map(x => [#x $"mm"^2$]),
      [3], ..averageDifference.at(3).map(x => [#x $"mm"^2$])
    ),
    caption: [Average change in area relative to starting area]
  )
    
}

// //PHOTOS
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
// 


#bibliography("works.bib")