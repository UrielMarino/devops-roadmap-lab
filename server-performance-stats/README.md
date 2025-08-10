# 01 – Server Performance Stats

**Enunciado**: Escribir un script `server-stats.sh` para analizar métricas básicas de rendimiento en Linux.  

**Referencia**: https://roadmap.sh/projects/server-stats

## 🎯 Requisitos del challenge (cumplidos)

1. **Total CPU usage** → Calculado como `100 - %idle` obtenido de la línea `Cpu(s)` de `top`.
2. **Total memory usage (Free vs Used + %)** → Extraído de `free -m` con cálculo `(usada / total) * 100`.
3. **Total disk usage (Free vs Used + %)** → Obtenido de la fila `total` de `df -h --total`.
4. **Top 5 procesos por CPU** → Usando `ps --sort=-%cpu` y mostrando los 5 primeros procesos.
5. **Top 5 procesos por memoria** → Usando `ps --sort=-%mem` y mostrando los 5 primeros procesos.



## ▶️ Uso

```bash
chmod +x ./server-stats.sh
./server-stats.sh
```

## 📌 Ejemplo de salida

<img width="812" height="641" alt="image" src="https://github.com/user-attachments/assets/055baa19-c85a-4e8a-aa2d-27eb70e98d00" />



