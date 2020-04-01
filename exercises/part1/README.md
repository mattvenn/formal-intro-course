# Exercises part 1

## Write cover statement for wolf, goat, cabbage

### Aim

We want to generate a trace that shows the solution to the wolf, goat, cabbage puzzle.

### Description

The file you need to change is wolf_goat_cabbage.sv.
There are already some `assume` statements in the design that limit how the solver
can manipulate the inputs in order to make the solution.

### Method

What is missing is a `cover` statement. This goes into the `always` block.
Write a cover statment that if reached will generate a solution to the puzzle.
Run the tools using this command:

    sby -f wolf_goat_cabbage.sby

Check the logs, did it succeed? If so, check the files generated in the new directory

    find wolf_goat_cabbage

The log will show you which file the trace is written to. Load it with gtkwave and 
add the traces for the movements of the wolf, goat and cabbage.

## Use a cover statement to show LED data is set in ws2812 core

### Aim

The ws2812 design generates control data for ws2812 'intelligent' LEDs. A long string
of LEDs can be connected with a single wire.

We want to see a quick trace that shows the module ready to transmit some data.

### Method

Instead of writing a test bench, you will write a cover statement that transfers some 
data to the module ready for LED transmission.

The internal register used for representing the last LED in the sequence is led_reg[7].

* Write a cover statement that covers this register being loaded with some value you choose.
* Copy the .sby file from wolf_goat_cabbage.sby and adapt it for the ws2812 design. 
* Run the tools and check the trace.

## Try to cover led control pin goes high in ws2812 core

### Aim

Generate a trace that shows the LED data on the data output pin changing.

### Method

* Write a cover statement that will generate a trace of the data pin changing.
* Add your cover to ws2812.v at the bottom of the file in the FORMAL section.
* Run the tools and generate a trace. Can you manage it? How?

## Cover some of the Traffic Light demo behaviour

### Aim

Take a look at the traffic lights demo. Check the picture to understand the way the lights
are arranged.

### Method

Open the simplecover.sv file. We have already defined a property using SVA.

There is one cover property already defined:

    pair_pedestrian_up:   cover property (signal_seq(pedestrian_green, up_green));

This will generate a trace for first the pedestrian green signal, and then some time later the up green signal.
Add some more properties to cover things like:

* pedestrian green -> down green
* up_green -> turn_green

