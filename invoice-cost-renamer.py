import sys
import re
import argparse
import datetime
import subprocess

grand_total = re.compile(r".*Grand.*$")
dollar = re.compile(r"\$[0-9]+.[0-9]+")

parser = argparse.ArgumentParser(description='Rename an invoice input file to prepend the dollar (amount) in the filename.')
parser.add_argument('-d', '--debug', action='store_true', help='Enables debug output that indicates when elements are skipped and not counted.')
parser.add_argument('filename')

args = parser.parse_args()
paper = None

def debug_print(a):         
    if args.debug: 
        print(a)

if args.filename[-4:].lower() == ".pdf":
    #print("PDF")
    now = datetime.datetime.now()
    formatted_date = now.strftime("%Y_%m_%d_%H_%M_%S")
    result = subprocess.run(['pdftotext', args.filename, 'out_' + formatted_date + '.txt'], capture_output=True, text=True)
    # note that pdftotext was run without layout flag
    with open('out_' + formatted_date + '.txt', 'r') as file:
        paper = file.readlines()

    for line in paper:
        debug_print(line.strip())
        match_group = grand_total.match(line.strip())
        debug_print(dollar.match(line.strip()))
        if match_group:
            debug_print("GOT IT" + match_group.group())
            value = line[match_group.group().find("$"):-1]
            print(value)

    subprocess.call(['mv', args.filename, str(value[1:-1])+"_"+args.filename])
