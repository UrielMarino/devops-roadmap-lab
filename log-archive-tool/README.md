# 02 – Log Archive Tool

**Enunciado**: Construir una herramienta CLI que archive (comprimir) logs con fecha y hora y los guarde en un nuevo directorio.
 **Referencia**: https://roadmap.sh/projects/log-archive-tool
## ✅ Requisitos del challenge (cumplidos)

1. Aceptar el **directorio de logs** como argumento (`./log-archive-tool.sh <dir>`).
2. **Comprimir** los logs en **`.tar.gz`**.
3. **Guardar** el archivo comprimido en un **nuevo directorio**.
4. **Incluir fecha y hora** en el nombre del archivo.
5. **Registrar** la fecha/hora del archivo en un **log**.

> Este script además valida que el directorio exista y, si no, solicita uno válido. También “formatea” el nombre del archivo reemplazando `/` por `_` para evitar problemas en el nombre del `.tar.gz`.

## ▶️ Uso

```bash
chmod +x ./log-archive-tool.sh
./log-archive-tool.sh /ruta/al/directorio/de/logs
```

Si el argumento está vacío o la ruta no existe, el script pedirá un directorio válido.

## 📦 Salida generada

- Archivo `.tar.gz` en:

  ```bash
  /home/<usuario>/Documentos/backups/
  ```

- Nombre del archivo:

  ```bash
  logs_<ruta_sanitizada>_<YYYYMMDD_HHMMSS>.tar.gz
  ```

  Ejemplo:

  ```bash
  logs__var_log_apache2_20250809_183000.tar.gz
  ```

- Registro en:

  ```bash
  /home/<usuario>/Documentos/backups/logs/stdout.txt
  ```

  Línea ejemplo:

  ```bash
  Se realizó un backup de /var/log/apache2 el: 2025-08-09 18:30:00
  ```

## 🔧 Comandos utilizados

- `tar -czf` → compresión en gzip (`.tar.gz`).
- `date +"%Y%m%d_%H%M%S"` → timestamp.
- `mkdir -p` → crea el directorio destino si no existe.
- `sed 's|/|_|g'` → sanitiza la ruta de origen para usarla en el nombre del archivo.
- Redirección `>>` → append al archivo de log.

## 🧪 Casos de prueba manuales

- **Ruta válida**: debe crear el `.tar.gz` y escribir en `stdout.txt`.
- **Ruta inválida**: el script debe solicitar otra ruta.
- **Rutas con espacios**: usar comillas al invocar (`"./Mi Carpeta/logs"`); el script ya cita la variable para evitar errores.
- **Permisos**: si algún archivo dentro del directorio no es legible, `tar` lo informará.
