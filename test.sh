#!/bin/sh

failures=0
skipped=0
for file in test/*.blade.php; do
	echo "Test $file"
	if [ ! -f "$file.html.expected" ]; then
		echo "No expected output exists; skipping"
		let skipped=skipped+1
	else
		vim -T dumb -u testrc.vim "$file" -c "so syntax/blade.vim" -c TOhtml >/dev/null 2>/dev/null <<EOF
/<pre id='vimCodeElement'>ditgg"_dGpdd:sav! %.actual:qa!
EOF
		diff=$(diff -u "$file.html.expected" "$file.html.actual")
		if [ $? -ne 0 ]; then
			echo "Test failed"
			echo "$diff"
			let failures=failures+1
		fi
		shift
	fi
done

if [ $failures -gt 0 ]; then
	echo "$skipped skipped, $failures failures"
	exit 1
elif [ $skipped -gt 0 ]; then
	echo "$skipped skipped, all others passed"
	exit 1
else
	echo "All tests passed"
	exit 0
fi
