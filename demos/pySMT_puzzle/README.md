[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mattvenn/formal-intro-course/blob/master/demos/pySMT_puzzle/pysmt_puzzle.ipynb)

# This is the tutorial example of pySMT

This example shows how to:
1. Deal with Theory atoms
2. Specify a solver in the shortcuts (get_model, is_sat etc.)
3. Obtain an print a model

The goal of the puzzle is to assign a value from 1 to 10 to each letter so that:

H+E+L+L+O = W+O+R+L+D = 25

## How to run the example

The example requires Python 3, and the pysmt package.

You can install pysmt using

```
$ sudo pip3 install pysmt
```

Then you may need a solver. You can install z3 using:

```
$ pysmt-install --z3 --confirm-agreement
```

Once the installation is finished, you can check that z3 is installed:

```
$ pysmt-install --check
Installed Solvers:
  msat      False (None)              Not in Python's path!
  cvc4      False (None)              Not in Python's path!
  z3        True (4.8.7)             
  yices     False (None)              Not in Python's path!
  btor      False (None)              Not in Python's path!
  picosat   False (None)              Not in Python's path!
  bdd       False (None)              Not in Python's path!

Solvers: z3
Quantifier Eliminators: z3, shannon, selfsub
UNSAT-Cores: z3
Interpolators: 
```

Now you can run the example:

```
$ python3 puzzle.py 
Serialization of the formula:
((((1 <= h) & (h < 10)) & ((1 <= e) & (e < 10)) & ((1 <= l) & (l < 10)) & ((1 <= o) & (o < 10)) & ((1 <= w) & (w < 10)) & ((1 <= r) & (r < 10)) & ((1 <= d) & (d < 10))) & (((h + e + l + l + o) = (w + o + r + l + d)) & ((h + e + l + l + o) = 25)))
w := 1
h := 1
d := 1
o := 9
r := 7
l := 7
e := 1
```
