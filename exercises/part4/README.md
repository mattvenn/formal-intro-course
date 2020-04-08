# Exercises part 4

## Cover busy_ctr busy going low with a MAX count set to 1000

### Aim

Get a trace of the busy output falling with the busy_ctr example, with a high MAX count.

### Description

With the counter decrementing by 1 each time, the tools will take too long to generate
a trace. We need to change it to an abstract counter.

### Method

* change the MAX count to 1000
* add a cover statment for busy falling (use $past or $fell)
* try to cover it, what happens?
* change the counter to an abstract counter
* can you generate a trace now?
* what happens when you try to prove it now?
* can you fix it?

## Cover data pin going high on ws2812 core

### Aim

We'd like to see some output data on the ws2812 core we looked at before.
As the timing interval takes too long, we need to change it to an abstract counter to generate a trace.

### Method

* add a cover statement to generate a trace with the data pin changing.
* run the tools and verify you can't get a trace
* change the counter to an abstract counter
* run the tools and check you can generate a trace.
