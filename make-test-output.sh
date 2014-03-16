#!/bin/bash
while [ $# -gt 0 ]; do
	echo "Generate HTML for $1"
	vim -T dumb -u testrc.vim "$1" -c "so syntax/blade.vim" -c TOhtml >/dev/null 2>/dev/null <<EOF
/<pre id='vimCodeElement'>ditgg"_dGpdd:sav! %.expected:qa!
EOF
	shift
done
