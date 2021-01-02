# ECMWF_WMO_TOOL
Esta herramienta permite descargar y graficar una serie de variables proveniente ECMWF Essential WMO 40 data. Disponiblidad de cuatro salidad del ECMWF: 00-06-12-18Z. Las salidas 00-12Z tienen instantes temporales cada 24 horas entre 0-240H; las salidas 06-18Z tienen instantes temporales cada 24 horas entre 0-72H. Las variables disponibles son:
- Geopotencial a 500 hPa (mgp)
- Temperatura a 850 hPa (m/s)
- Presión a nivel del mar (hPa)
- Viento a 850 hPa (Campos U y V) 

Para correr este script es necesario tener un sistema Unix y tener instalado con las siguientes librerías:
-NetCDF4
-Numpy
-Basemap (sí, se debería hacer con Cartopy, pero da problemas. Intentaré mejorarlo)
-Glob
-wgrib2 

# USO DEL SCRIPT
Tienes que correr el script 'ecmwf.sh'y te preguntará que salida quieres. Se tendrá que poner en este formato YYYYMMDDZZ (Ejemplo: 2021010212)
-YYYY -> Año
-MM -> Mes
-DD -> Día
-ZZ -> Salida (00-06-12-18)
Antes de procesar los archivos .bin pedirá el día y la salida (DDZZ - Ejemplo: 0212). En el procesamiento se convierte el .bin en .nc. También se hace un merge de los archivos de geopotencial a 500 hPa con la presión a nivel del mar para posteriormente plotearlo ambas variables juntas. 
Previo a plotear las variables en python pedirá la salida en el mismo formato que la primera vez. 
De momento solo se plotea Geopotencial a 500 hPa y Presión a nivel del mar y Temperatura a 850 hPa. En los próximos días añadiré Viento a 850 hPa. 

# EJEMPLOS
- Geopotencial a 500 hPa y Presión a nivel del mar 
![](examples/Geop500_MSLP.gif)

- Temperatura a 850 hPa 
![](examples/T850.gif)
