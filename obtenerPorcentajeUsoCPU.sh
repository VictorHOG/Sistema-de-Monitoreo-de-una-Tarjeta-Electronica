#!/bin/bash

export userUsedPercentageCPU=$(iostat -c | head -n +4 | tail -n +4 | tr -s ' ' | cut -d ' ' -f 2)
echo $userUsedPercentageCPU > userUsedPercentageCPU.txt

export systemUsedPercentageCPU=$(iostat -c | head -n +4 | tail -n +4 | tr -s ' ' | cut -d ' ' -f 4)
echo $systemUsedPercentageCPU > systemUsedPercentageCPU.txt
