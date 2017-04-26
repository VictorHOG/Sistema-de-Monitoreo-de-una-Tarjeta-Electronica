#!/bin/bash

export uploadBandwidth=$(speedtest-cli | grep Upload | tr -s ' ' | cut -d ' ' -f 2)
echo $uploadBandwidth >  uploadBandwidth.txt 

export downloadBandwidth=$(speedtest-cli | grep Download | tr -s ' ' | cut -d ' ' -f 2)
echo $downloadBandwidth >  downloadBandwidth.txt

