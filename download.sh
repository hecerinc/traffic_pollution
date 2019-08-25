#/bin/bash
# LIST=()
count=0
NAM=("santacatarina" "sanbernabe" "obispado" "sannicolas" "pastora" "escobedo" "garcia" "juarez" "sanpedro" "universidad" "puebloserena")
ARR=(31 33 24 28 30 15 22 30 29 19 15)
for a in 139 140 141 142 143 144 145 147 148 425 426; do
	mkdir ${NAM[$count]}
	for i in `seq 1 ${ARR[$count]}`; do
		printf -v j "%02d" $i
		echo "${NAM[$count]}/page_$j.json"
		curl -o "${NAM[$count]}/page_$j.json" "https://api.datos.gob.mx/v2/sinaica?estacionesid=$a&pageSize=1000&page=$i"
	done
	count=$((count+1))
done
