#!/bin/bash
for number in 1 2 3 4; do
    in_dir="Testcase${number}"
    out_dir="Testcase${number}Diff"
    echo "$in_dir -> $out_dir"

    for file1 in "$in_dir"/*.1.txt; do
        echo "$file1"
        done 
    done
