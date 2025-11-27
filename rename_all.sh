#!/usr/bin/env bash
for file in *
do
  python3 invoice-cost-renamer.py "$file"
done
