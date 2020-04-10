# Exercises part 4

## Cover busy_ctr busy going low with a MAX count set to 1000

### Aim

Get a trace of the busy output falling with the busy_ctr example, with a high MAX count.

### Description

With the counter decrementing by 1 each time, the tools will take too long to generate
a trace. We need to change it to an abstract counter.

An abstract counter allows us to shortcut the long counting. We can do this by creating 
a new increment variable and allowing the solver to choose the values with anyseq.

We want to make sure the design still passes the proof we made earlier to ensure the abstraction
is correct.

### Method

* change the MAX count to 1000
* add a cover statment for busy falling (use $past or $fell)
* try to cover it, what happens?
* change the counter to an abstract counter using anyseq.
* does the design still pass the proof?
* can you generate a cover trace now?
* you will need to make assumptions about what the values of the abstract counter can be.

## Cover data pin going high on ws2812 core

### Aim

We'd like to see some output data on the ws2812 core we looked at before.
As the timing interval takes too long, we need to change it to an abstract counter to generate a trace.

### Method

* add a cover statement to generate a trace with the data pin changing.
* run the tools and verify you can't get a trace
* change the counter to an abstract counter
* run the tools and check you can generate a trace.

## Another abstraction demo

This is a great demo from Claire Wolf. It illustrates an abstract counter without modifying the original
design. Ideally when doing verification we'd like to avoid changing any of the design files. This
example achieves that by changing assumptions to assertions, a cutpoint, and binding properties to the design
file.

https://github.com/YosysHQ/SymbiYosys/tree/master/docs/examples/abstract
