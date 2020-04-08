# Exercises part 3

## Write safety properties for MARLANN memory

### Aim

The MARLANN machine learning accelerator features a 10 step pipeline that parallelises the 
computation. The target FPGA has a large memory used for the coefficients, but it is single ported,
so reads and writes cannot happen on the same cycle.

We want to know that no matter what instructions are read in what order, the memory never gets a simultaneous
read and write request.

### Method

Write a single assertion that proves that the pipeline is memory safe.

The relevant signals are:

	reg        mem_rd0_en;
	reg        mem_rd1_en;
	reg [ 7:0] mem_wr_en;

Write your assertion at line 198

Take a look at the .sby file. What do you think the cutpoint line does?

## Make a full proof for the simple counter with overflow set to 1000.

### Aim

Prove the busy counter works for all time with a full proof.

### Description

Previously we just did a BMC. This time we will add k-induction.
Then we will add a new assertion to prove the counter will never 
equal 2000.

### Method

* Change the MAX_AMOUNT of the simple counter to 1000
* update the sby file to change the mode from bmc to prove
* run the tools and verify the counter works correctly
* add a new assertion that proves the counter will never equal 2000. 
    Do you expect it to pass or fail?
* run sby to check your expectation. Look at the logs from the tool, what is different?
* If it fails, the trace will be written as trace_induct.vcd

## Find 2 ways to make a full proof of the double shift register.

### Aim

Here we have an example of state split in 2 submodules.
We want to prove the output of the shift registers is the same. This 
is trivial with BMC, but how do we do k-induction?

### Method

* write an assertion that will prove the output of the shift registers is the same
* run a BMC and check it works
* switch to mode prove, what happens now?
* how can you get the prove to pass?

## Make a full safety proof of the traffic lights

### Aim

We've shown that the traffic light signals work to allow each flow of traffic to 
happen, but is it safe? The aim is to prove the safety of the intersection for all
the ways of traffic crossing.

### Method

Open the safety.sv file in the traffic lights demo. We already have a property:

    safe_pedestrian_up:   assert property (pedestrian_green |-> !  up_green);

Add another 5 properties that between them prove that the intersection is safe.
