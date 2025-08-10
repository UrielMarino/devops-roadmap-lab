#!/bin/bash


# Recibir el directorio de logs como $1.
# Comprimirlo en .tar.gz.
# Guardar ese archivo comprimido en un directorio de tu elección (o uno fijo tipo ./archives).
# Que el nombre del .tar.gz tenga fecha y hora.
# Registrar esa fecha/hora en un archivo de log.


origenBackup=$1


while [ -z "$origenBackup" ] || [ ! -d "$origenBackup" ]; do
echo "El directorio no existe o está vacio, ingresá otro"
read origenBackup
done

user=$(whoami)
nameDate=$(date +"%Y%m%d_%H%M%S")
safeName=$(echo "$origenBackup" | sed 's|/|_|g')

mkdir -p /home/$user/Documentos/backups/logs

tar -czf /home/$user/Documentos/backups/logs_${safeName}_${nameDate}.tar.gz "$origenBackup"
echo "Se realizó un backup de "$origenBackup" el: $(date '+%Y-%m-%d %H:%M:%S')" >> /home/$user/Documentos/backups/logs/stdout.txt
echo "Se hizo backup de "$origenBackup""

