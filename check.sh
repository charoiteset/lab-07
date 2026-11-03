#!/bin/bash
all_ok=1

for number in 1 2 3 4; do
in_dir="Testcase${number}"
out_dir="Testcase${number}Diff"
ok=1
any_diff=0

for file1 in "$in_dir"/*.1.txt; do
file2="${file1%.1.txt}.2.txt"
base=$(basename "$file1")
outfile="$out_dir/${base%.1.txt}Diff.txt"

if cmp -s "$file1" "$file2"; then
[ -f "$outfile" ] && ok=0
else
any_diff=1
cmp -s <(diff -u "$file1" "$file2" | tail -n +3) <(tail -n +3 "$outfile" 2>/dev/null) || ok=0
[ -f "$outfile" ] || ok=0
fi
done

[ -d "$out_dir" ] && [ "$any_diff" -eq 0 ] && ok=0
[ -d "$out_dir" ] || [ "$any_diff" -eq 0 ] || ok=0

if [ "$ok" -eq 1 ]; then
echo "Testcase${number}: PASS"
else
echo "Testcase${number}: FAIL"
all_ok=0
fi
done

[ "$all_ok" -eq 1 ]
