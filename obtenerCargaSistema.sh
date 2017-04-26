#!/bin/bash

export averageOverLastMinut=$(uptime | awk -F'[a-z]:' '{ print $2}' | tr -d , | cut -d ' ' -f 2)
echo $averageOverLastMinut > averageOverLastMinut.txt

export averageOverLastFiveMinutes=$(uptime | awk -F'[a-z]:' '{ print $2}' | tr -d , | cut -d ' ' -f 3)
echo $averageOverLastFiveMinutes > averageOverLastFiveMinutes.txt

export averageOverLastFifteenMinutes=$(uptime | awk -F'[a-z]:' '{ print $2}' | tr -d , | cut -d ' ' -f 4)
echo $averageOverLastFifteenMinutes > averageOverLastFifteenMinutes.txt
