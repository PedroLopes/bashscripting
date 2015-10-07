#!/bin/bash

echo Shrinking pdf: $1 to $1_s.pdf with prepress option
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$1_s.pdf $1
