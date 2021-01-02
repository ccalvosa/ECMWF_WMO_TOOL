###################################################
####DESCARGA Y PLOTEO DE LAS SALIDAS DEL ECMWF#####
###################################################

#borra todo lo que tenías en la terminal

clear

#Seleccionamos salida que queremos (00Z, 06Z, 12Z, 18Z)
echo "I N S T R U C C I O N E S"
echo "Tenemos que seleccionar dos veces la salida. La primera para descargar y la segunda para procesar el archivo. Estate atento en como se pide los archivos. Habrá un ejemplo. Ten una carpeta con el nombre 'export' en la carpeta que corres este script"
echo "¡¡¡Vamos a descargar el ECMWF¡¡¡¡"
read -p '¿Qué salida quieres? Ejemplo: "2021010212" ' salida
echo "De acuerdo, descargamos $salida Z"

#descargamos todos los archivos .bin de la salida
wget -m ftp://wmo:essential@dissemination.ecmwf.int/${salida}0000/

cd dissemination.ecmwf.int/${salida}0000
mkdir netcdf

#convertimos los archivos .bin en .grb y luego en .nc
#variables constantes
geop=HH
slp=HP
t850=HT
wu=HU
wv=HV

to_an=XA
to_24=XE
to_48=XI
to_72=XK
to_96=XM
to_120=XO
to_144=XQ
to_168=XS
to_192=XW
to_216=XY
to_240=XT

read -p '¿Cuál es nuestra salida? Ejemplo: "0212" ' salida2

#loop analisis o 0H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_an}50ECMF${salida2}00_C_ECMF_${salida}0000_an_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_an.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_an}89ECMF${salida2}00_C_ECMF_${salida}0000_an_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_an.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_an}85ECMF${salida2}00_C_ECMF_${salida}0000_an_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_an.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_an}85ECMF${salida2}00_C_ECMF_${salida}0000_an_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_an.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_an}85ECMF${salida2}00_C_ECMF_${salida}0000_an_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_an.grb
done
echo 'Procesado Geopotencial Analisis o 0H'

#loop analisis o 24H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_24}50ECMF${salida2}00_C_ECMF_${salida}0000_24h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_24.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_24}89ECMF${salida2}00_C_ECMF_${salida}0000_24h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_24.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_24}85ECMF${salida2}00_C_ECMF_${salida}0000_24h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_24.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_24}85ECMF${salida2}00_C_ECMF_${salida}0000_24h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_24.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_24}85ECMF${salida2}00_C_ECMF_${salida}0000_24h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_24.grb
done
echo 'Procesado Geopotencial 24H'

#loop analisis o 48H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_48}50ECMF${salida2}00_C_ECMF_${salida}0000_48h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_48.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_48}89ECMF${salida2}00_C_ECMF_${salida}0000_48h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_48.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_48}85ECMF${salida2}00_C_ECMF_${salida}0000_48h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_48.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_48}85ECMF${salida2}00_C_ECMF_${salida}0000_48h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_48.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_48}85ECMF${salida2}00_C_ECMF_${salida}0000_48h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_48.grb
done
echo 'Procesado Geopotencial 48H'

#loop analisis o 72H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_72}50ECMF${salida2}00_C_ECMF_${salida}0000_72h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_72.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_72}89ECMF${salida2}00_C_ECMF_${salida}0000_72h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_72.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_72}85ECMF${salida2}00_C_ECMF_${salida}0000_72h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_72.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_72}85ECMF${salida2}00_C_ECMF_${salida}0000_72h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_72.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_72}85ECMF${salida2}00_C_ECMF_${salida}0000_72h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_72.grb
done
echo 'Procesado Geopotencial 72H'

#loop analisis o 96H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_96}50ECMF${salida2}00_C_ECMF_${salida}0000_96h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_96.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_96}89ECMF${salida2}00_C_ECMF_${salida}0000_96h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_96.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_96}85ECMF${salida2}00_C_ECMF_${salida}0000_96h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_96.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_96}85ECMF${salida2}00_C_ECMF_${salida}0000_96h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_96.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_96}85ECMF${salida2}00_C_ECMF_${salida}0000_96h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_96.grb
done
echo 'Procesado Geopotencial 96H'

#loop analisis o 120H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_120}50ECMF${salida2}00_C_ECMF_${salida}0000_120h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_120.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_120}89ECMF${salida2}00_C_ECMF_${salida}0000_120h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_120.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_120}85ECMF${salida2}00_C_ECMF_${salida}0000_120h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_120.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_120}85ECMF${salida2}00_C_ECMF_${salida}0000_120h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_120.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_120}85ECMF${salida2}00_C_ECMF_${salida}0000_120h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_120.grb
done
echo 'Procesado Geopotencial 120H'

#loop analisis o 144H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_144}50ECMF${salida2}00_C_ECMF_${salida}0000_144h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_144.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_144}89ECMF${salida2}00_C_ECMF_${salida}0000_144h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_144.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_144}85ECMF${salida2}00_C_ECMF_${salida}0000_144h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_144.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_144}85ECMF${salida2}00_C_ECMF_${salida}0000_144h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_144.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_144}85ECMF${salida2}00_C_ECMF_${salida}0000_144h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_144.grb
done
echo 'Procesado Geopotencial 144H'

#loop analisis o 168H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_168}50ECMF${salida2}00_C_ECMF_${salida}0000_168h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_168.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_168}89ECMF${salida2}00_C_ECMF_${salida}0000_168h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_168.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_168}85ECMF${salida2}00_C_ECMF_${salida}0000_168h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_168.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_168}85ECMF${salida2}00_C_ECMF_${salida}0000_168h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_168.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_168}85ECMF${salida2}00_C_ECMF_${salida}0000_168h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_168.grb
done
echo 'Procesado Geopotencial 168H'

#loop analisis o 192H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_192}50ECMF${salida2}00_C_ECMF_${salida}0000_192h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_192.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_192}89ECMF${salida2}00_C_ECMF_${salida}0000_192h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_192.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_192}85ECMF${salida2}00_C_ECMF_${salida}0000_192h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_192.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_192}85ECMF${salida2}00_C_ECMF_${salida}0000_192h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_192.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_192}85ECMF${salida2}00_C_ECMF_${salida}0000_192h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_192.grb
done
echo 'Procesado Geopotencial 192H'

#loop analisis o 216H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_216}50ECMF${salida2}00_C_ECMF_${salida}0000_216h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_216.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_216}89ECMF${salida2}00_C_ECMF_${salida}0000_216h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_216.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_216}85ECMF${salida2}00_C_ECMF_${salida}0000_216h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_216.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_216}85ECMF${salida2}00_C_ECMF_${salida}0000_216h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_216.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_216}85ECMF${salida2}00_C_ECMF_${salida}0000_216h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_216.grb
done
echo 'Procesado Geopotencial 216H'

#loop analisis o 240H
for idx in gh_500hPa; do
wgrib2 A_${geop}${to_240}50ECMF${salida2}00_C_ECMF_${salida}0000_240h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_240.grb
done
for idx in msl; do
wgrib2 A_${slp}${to_240}89ECMF${salida2}00_C_ECMF_${salida}0000_240h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_240.grb
done
for idx in t_850hPa; do
wgrib2 A_${t850}${to_240}85ECMF${salida2}00_C_ECMF_${salida}0000_240h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_240.grb
done
for idx in u_850hPa; do
wgrib2 A_${wu}${to_240}85ECMF${salida2}00_C_ECMF_${salida}0000_240h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_240.grb
done
for idx in v_850hPa; do
wgrib2 A_${wv}${to_240}85ECMF${salida2}00_C_ECMF_${salida}0000_240h_${idx}_global_0p5deg_grib2.bin -grib_out ./netcdf/${idx}_240.grb
done
echo 'Procesado Geopotencial 240H'

#Convertimos el .grb a .nc

for file in ./netcdf/*;do
cdo -f nc copy ${file} ${file}.nc
done
#rm ./netcdf/*.grb

#Merge de Geop500hPa y MSLP - loop
for time in an 24 48 72 96 120 144 168 192 216 240; do
cdo merge ./netcdf/gh_500hPa_${time}.grb.nc ./netcdf/msl_${time}.grb.nc ./netcdf/gh_msl_${time}.nc
done

#Merge de U y V - loop
for time in an 24 48 72 96 120 144 168 192 216 240; do
cdo merge ./netcdf/u_850hPa_${time}.grb.nc ./netcdf/v_850hPa_${time}.grb.nc ./netcdf/u_v_${time}.nc
done

############################################
####PLOTEAMOS CON PYTHON CADA VARIABLE######
############################################

echo "Ahora nos va a pedir otra vez que salida estamos utilizando. Ejemplo '2021010206'"

python ../../geop_mslp.py
python ../../t850.py

































