#!/bin/bash

$cmd="pdftotext \"{}\" - | grep --with-filename --label=\"{}\" --color -C3 \"$2\"";
find $1 -name '*.pdf' -exec sh -c "$cmd" \;
