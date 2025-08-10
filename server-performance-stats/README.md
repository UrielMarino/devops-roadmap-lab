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

=========================== CPU TOTAL ============================
Uso total de CPU: 8.0%

========================== MEMORIA TOTAL =========================
Total: 31836 MB | Usada: 7480 MB (23.5%) | Libre: 19849 MB

============================== DISCO =============================
Total: 480G | Usado: 43G (10%) | Libre: 414G

======================== TOP 5 POR CPU ===========================
  PID USER     %CPU %MEM COMMAND
 4307 umarino  42.2  1.6 Discord
 2944 umarino  28.6  0.4 Xorg
 6454 umarino  13.0  1.4 chrome
 6114 umarino   5.8  1.1 chrome
17312 umarino   4.7  1.3 chrome

======================== TOP 5 POR MEM ===========================
  PID USER     %CPU %MEM COMMAND
 3495 umarino   0.5  1.7 gnome-software
 4307 umarino  42.2  1.6 Discord
 6454 umarino  13.0  1.4 chrome
 3269 umarino   4.3  1.4 gnome-shell
 2473 dnsmasq   0.4  1.4 mysqld
