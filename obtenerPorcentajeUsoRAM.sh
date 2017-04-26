#!/bin/bash

export usedMem=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 3)

export usedMem=$((usedMem * 100))

export usedTotal=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 2)

export usedPercentageRAM=$((usedMem / usedTotal))

echo $usedPercentageRAM > usedPercentageRAM.txt
