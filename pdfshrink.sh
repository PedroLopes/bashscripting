#!/bin/bash

PS3='Select compression: '
options=("Highest-quality (prepress)" "Good (printer)" "Medium (ebook)" "Lowest (screen)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Highest-quality (prepress)")
            echo "Will compress using: Highest-quality (prepress) option"
            compress="prepress"
            break;;
        "Good (printer)")
            echo "Will compress using: Good-quality (printer) option"
            compress="printer"
            break;;
        "Medium (ebook)")
            echo "Will compress using: Medium-quality (ebook) option"
            compress="ebook"
            break;;
        "Lowest (screen)")
            echo "Will compress using: Lowest-quality (screen) option"
            compress="screen"
            break;;
        "Quit")
            break
            ;;
        *) echo "Invalid quality choice: $REPLY does not exist in list";;
    esac
done


finalname=$(basename "$1" ".pdf")_s.pdf

initial_size=`du -m $1 | cut -f1`;

echo Shrinking pdf: $1 to $(basename "$1" ".pdf")_s.pdf with $compress option;
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${compress} -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(basename "$1" ".pdf")_s.pdf $1;

final_size=`du -m $(basename "$1" ".pdf")_s.pdf | cut -f1`;
echo Compressed: $(($final_size - $initial_size)) MB
