#!/bin/bash

# Bash uses brace expansion to generate a sequence of strings from the terminal or by using any bash script.

# A sequence of expressions or comma-separated list of data with curly brackets is used to define brace expansion.

    # {String1, String2,... ,StringN } -- {aa, bb}
    # {<start> . . <end>}              -- {0..9}
    # <preamble>{ string or range } OR { string or range }<postscript> OR <preamble>{ string or range }<postscript>

# What do they print?

# Using comma-separated lists
echo {aa,bb,cc,dd}                              # aa bb cc dd

# Using Ranges
echo {1..100}                                   # 1 2 3 4 5 6 ... 100
echo {a..z}                                     # a b c d e f ... z
echo a{0..9}b                                   # a0b a1b a2b a3b a4b ... a9b

# Using preamble
echo "Hi "{Yazan, Aseel, Tala}                  # "Hi Yazan" "Hi Aseel" "Hi Tala"
echo b{all, ell, oat, eef}                      # ball bell boat beef

# Using postscript
echo {Husam,Omar,Walaa}" is a programmer."      # "Husam is a progarmmer." ...
echo {basket,foot,volley}ball                   # basketball football volleyball