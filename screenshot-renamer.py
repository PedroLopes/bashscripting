import sys
import re
import time

#this takes in a file and if that file contains a date in the format YYYY-MM-DD, then it renames that file to just the date and a timestamp of creation date.

original_filename = sys.argv[1]

date = re.findall(r'\d{4}-\d{2}-\d{2}', original_filename)
extension = re.findall(r"\.[aA-zZ]+", original_filename)
output_file = "None"

if date:
  output_file = str(date[0]) + "-" + str(time.time()) + str(extension[0])
   
print(output_file)
