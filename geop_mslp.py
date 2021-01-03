from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import glob


files = glob.glob('./netcdf/gh_msl*.nc')

for x in files:
        
	fh = Dataset(x, mode='r')
	lons = fh.variables['lon'][:]
	lats = fh.variables['lat'][:]
	geop = fh.variables['gh'][:]
	slp  = fh.variables['msl'][:]/100
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
	clevs = np.arange(4500,6150,50)
	clevs2 = np.arange(960,1040,4)
	cs = m.contourf(xi,yi,np.squeeze(geop), clevs, cmap='jet')
	cs2 = m.contour(xi,yi,np.squeeze(slp), clevs2, colors="white", linewidths=1)
	plt.clabel(cs2, inline=2, fontsize=10, fmt="%i")

# Add Grid Lines
	m.drawparallels(np.arange(-80., 81., 10.), labels=[1,0,0,0], fontsize=10)
	m.drawmeridians(np.arange(-180., 181., 10.), labels=[0,0,0,1], fontsize=10)

# Add Coastlines, States, and Country Boundaries
	m.drawcoastlines()
	m.drawstates()
	m.drawcountries()

# Add Colorbar
	cbar = m.colorbar(cs, location='bottom', pad="5%")
	cbar.set_label('Metros geopotenciales', fontsize=15)

# Add Title
	plt.title("Fecha: "+date.units[12:30]+' +'+x[16:19]+" Modelo ECMWF", fontsize=20, ha="center", fontweight='bold')

	plt.savefig('../../export/'+date.units[12:30]+'_'+x[16:19]+'_geop_500hPa.png', bbox_inches='tight', dpi=300)

