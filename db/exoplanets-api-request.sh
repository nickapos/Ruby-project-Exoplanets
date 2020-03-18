#!/bin/bash
wget "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&select=pl_hostname,pl_name,pl_discmethod,pl_pnum,pl_orbper,gaia_dist,st_teff,st_mass,st_rad,pl_eqt,pl_masse,pl_rade,pl_ratdor,pl_disc,pl_telescope,pl_pelink,pl_edelink,st_spstr,st_logg,st_lum,st_dens,st_metfe,st_metratio,st_age&order=pl_hostname&format=csv" -O "planets-api.csv"

#link with api docs https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html
