DROP TABLE exoplanets;
CREATE TABLE exoplanets(
       loc_rowid serial PRIMARY KEY,
       pl_hostname VARCHAR (255),
       pl_name VARCHAR (255),
       pl_discmethod VARCHAR (255),
       pl_pnum INT,
       pl_orbper NUMERIC,
       gaia_dist NUMERIC,
       st_teff NUMERIC,
       st_mass NUMERIC,
       st_rad NUMERIC,
       pl_eqt NUMERIC,
       pl_masse NUMERIC,
       pl_rade NUMERIC,
       pl_ratdor NUMERIC,
       pl_disc VARCHAR (255),
       pl_telescope VARCHAR (255),
       pl_pelink VARCHAR (255),
       pl_edelink VARCHAR (255),
       st_spstr VARCHAR (255),
       st_logg NUMERIC,
       st_lum NUMERIC,
       st_dens NUMERIC,
       st_metfe NUMERIC,
       st_metratio VARCHAR (255),
       st_age NUMERIC
);
