#!/bin/bash

while [ true ]
do

./obtenerPorcentajeUsoCPU.sh

export userUsedPercentageCPU=$(cat userUsedPercentageCPU.txt)
export systemUsedPercentageCPU=$(cat systemUsedPercentageCPU.txt)

./obtenerPorcentajeUsoRAM.sh

export usedPercentageRAM=$(cat usedPercentageRAM.txt)

./obtenerDisponibilidadAlmacenamiento.sh

export  availableStorage=$(cat availableStorage.txt)

./obtenerCargaSistema.sh

export averageOverLastMinut=$(cat averageOverLastMinut.txt)
export averageOverLastFiveMinutes=$(cat averageOverLastFiveMinutes.txt)
export averageOverLastFifteenMinutes=$(cat averageOverLastFifteenMinutes.txt)

./obtenerAnchoBanda.sh

export downloadBandwidth=$(cat downloadBandwidth.txt)
export uploadBandwidth=$(cat uploadBandwidth.txt)


echo "Porcentaje de uso de la CPU por parte del usuario: $userUsedPercentageCPU %"
echo "Porcentaje de uso de la CPU por parte del sistema: $systemUsedPercentageCPU %"
echo "Porcentaje de uso de la memoria RAM: $usedPercentageRAM %"
echo "Almacenamiento disponible: $availableStorage"
echo "Promedio de carga del sistema durante el ultimo minuto: $averageOverLastMinut"
echo "Promedio de carga del sistema durante los ultimos cinco minutos: $averageOverLastFiveMinutes"
echo "Promedio de carga del sistema durante los ultimos quince  minutos: $averageOverLastFifteenMinutes"
echo "Ancho de banda de bajada: $downloadBandwidth"
echo "Ancho de banda de subida: $uploadBandwidth"

# Send values to ThingSpeak
export apiKey=T4RBQ88Y97S4UANY

export update=$(curl --silent --request POST --header "X-THINGSPEAKAPIKEY: $apiKey" --data "field1=$userUsedPercentageCPU&field2=$systemUsedPercentageCPU&field3=$usedPercentageRAM&field4=$availableStorage&field5=$averageOverLastMinut&field6=$averageOverLastFiveMinutes&field7=$downloadBandwidth&field8=$uploadBandwidth" "http://api.thingspeak.com/update")

echo "Update #$update"

sleep 3m

done
