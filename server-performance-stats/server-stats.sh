#!/bin/bash

echo "=========================== CPU TOTAL ============================"
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed 's/,/./g' | awk '{print $8}')
CPU_USED=$(awk "BEGIN {print 100 - $CPU_IDLE}")
printf "Uso total de CPU: %.1f%%\n\n" "$CPU_USED"


echo "========================== MEMORIA TOTAL ========================="
# free -m muestra total/usada/libre en MB y calculamos el %
free -m | awk '/^Mem:/ {pct=$3/$2*100; printf "Total: %d MB | Usada: %d MB (%.1f%%) | Libre: %d MB\n\n", $2,$3,pct,$4}'

echo "============================== DISCO ============================="
# df -h --total nos da la fila 'total' con usado/libre y %
df -h --total | awk 'END{printf "Total: %s | Usado: %s (%s) | Libre: %s\n\n", $2,$3,$5,$4}'

echo "======================== TOP 5 POR CPU ==========================="
# ps ordena por %CPU y mostramos las primeras 5 filas (más el encabezado)
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
echo

echo "======================== TOP 5 POR MEM ==========================="
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
echo
