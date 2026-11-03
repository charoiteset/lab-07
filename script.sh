#!/bin/bash
for number in 1 2 3 4; do
    in_dir="Testcase${number}"
    out_dir="Testcase${number}Diff"
    rm -rf "$out_dir" #deletes old testcases in the loop

    for file1 in "$in_dir"/*.1.txt; do
        echo "$file1" 
    
    file2="${file1%.1.txt}.2.txt"
    base=$(basename "$file1")
    outname="${base%.1.txt}Diff.txt"
if cmp -s "$file1" "$file2"; then
    echo "those files match: $outname"
else
    echo "those files differ: $outname"
fi
done
done
