#!/bin/bash

echo Shrinking pdf: $1 to $(basename "$1" ".pdf")_s.pdf with prepress option
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(basename "$1" ".pdf")_s.pdf $1
