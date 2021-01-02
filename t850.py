from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import glob

salida = int(input('¿Cuál es tu salida? La misma que el comienzo. Ejemplo "2021010206"'))

files = glob.glob('/home/carlos-wrf/ECMWF/dissemination.ecmwf.int/{}0000/netcdf/t_850hPa*.nc' .format(salida))

for x in files:
        
	fh = Dataset(x, mode='r')
	lons = fh.variables['lon'][:]
	lats = fh.variables['lat'][:]
	t850 = fh.variables['t'][:]-273.15
	date = fh.variables['time']

# Get some parameters for the Stereographic Projection
	lon_0 = 0
	lat_0 = 50

	m = Basemap(width=6000000,height=4500000,
                    resolution='h',projection='stere',\
                    lat_ts=40,lat_0=lat_0,lon_0=lon_0)

	lon, lat = np.meshgrid(lons, lats)
	xi, yi = m(lon, lat)

# Plot Data
	plt.figure(figsize=(15,30))
	clevs = [-30.,-27.5,-25.,-22.5,-20.,-17.5,-15.,-12.5,-10.,-7.5,-5.,-2.5,0.,2.5,5.,7.5,10.,12.5,15.,17.5,20.,22.5,25.,27.5,30.]
	clevs3 = [-30.,-25.,-20.,-15.,-10.,-5.,0.,5.,10.,15.,20.,25.,30.]
	clevs2 = np.arange(-25,25,10)
	cs = m.contourf(xi,yi,np.squeeze(t850), clevs, cmap='jet')
	cs2 = m.contour(xi,yi,np.squeeze(t850), clevs2, colors="white", linewidths=1)
	plt.clabel(cs2, inline=2, fontsize=10, fmt="%i")

# Add Grid Lines
	m.drawparallels(np.arange(-80., 81., 10.), labels=[1,0,0,0], fontsize=10)
	m.drawmeridians(np.arange(-180., 181., 10.), labels=[0,0,0,1], fontsize=10)

# Add Coastlines, States, and Country Boundaries
	m.drawcoastlines()
	m.drawstates()
	m.drawcountries()

# Add Colorbar
	cbar = m.colorbar(cs, location='bottom', pad="5%", ticks=clevs3)
	cbar.set_label('Temperatura a 850 hPa (ºC)', fontsize=15)

# Add Title
	plt.title("Fecha: "+date.units[12:30]+' +'+x[78:81]+" Modelo ECMWF", fontsize=20, ha="center", fontweight='bold')

	plt.savefig('../../export/'+date.units[12:30]+'_'+x[78:81]+'_t_850hPa.png', bbox_inches='tight', dpi=300)

