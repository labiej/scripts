#!/bin/bash

bc << EOF
scale=4
$1
quit
EOF
