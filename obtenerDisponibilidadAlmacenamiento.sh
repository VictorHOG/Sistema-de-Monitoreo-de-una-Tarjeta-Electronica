#!/bin/bash
export availableStorage=$( df | grep /dev/mmcblk0p2 |  tr -s ' ' | cut -d ' ' -f 4)
echo $availableStorage > availableStorage.txt
