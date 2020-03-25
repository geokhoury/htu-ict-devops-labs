#!/bin/bash

# In Linux, find out the true file type using the file command.

# The file command runs three sets of tests against a file:

    # Filesystem tests
    # Magic tests
    # Language tests

## Filesystem tests

# Filesystem tests examine the return from a stat system call. 
# The program checks to see if the file is empty and whether it is a special file. 
# If the file type is found in the system header file, it is returned as the valid file type.

## Magic tests

# The magic tests check the contents of a file and specifically a few bytes at the beginning that help to determine the file type. 
# Various files are used to help match up a file with its file type, and these are stored in:

    # /etc/magic
    # /usr/share/misc/magic
    # /usr/share/misc/magic.mgc

## Language tests

# The file is checked to see if it is a text file. 
# By testing the first few bytes of a file, the test deduces whether the file is an ASCII, UTF-8, UTF-16 or another format that identifies the file as a text file. 
# When the character set is deduced, the file is tested against different languages.



## 
# Exmamples
##

# SVG file type: SVG Scalable Vector Graphics image
# ODS file type: OpenDocument Spreadsheet
# PDF file type: PDF Document, version 1.4
# CSV file type: ASCII text, with very long lines, with CRLF line indicators