 Exoplanets App

 An educational astronomy app that presents all up to date
 confirmed exoplanets and their basic details
 in a way that  allows the search through data and discover habitable
 planets by certain criteria .

 New planets and details can be added , removed and also updated .

 All Data are up to date and  have been download from the Nasa open source
  website that encourages the use of these data for educational purposes around
  the world.

 The exoplanets table is a work in progress as more confirmed planets
 are added every week

 (The data were downloaded as csv and imported using psql (copy - from)
 insert-from-csv.sql and table.sql are in the  project folder, but I might
 need to change some columns.
 The final table combines more then 4000 rows and 38 columns )

 MVP

1)Exploring exoplanets :
You can find all confirmed exoplanets  by  Star ,
by their radius, temperature ,size of their Star,
distance from earth and 10 more data fields.

plus Links to Exoplanet Data Encyclopaedia for all confirmed exoplanets
(example : http://exoplanet.eu/catalog/epic_249893012_b/)

You can manually delete and edit planets and their details also update planet data fields.

2)Retrieve all planets in each of these astronomic size categories:
Earth size planets (0 to 1.25 times Earth size)[example: Kepler-10b]
Super-Earths (1.25 to 2 times Earth size)[example: Kepler-11b]
Mini-Neptune (2 to 4 times Earth size) [example: Kepler-11c]
Neptune (4-6 times Earth size) [example: Kepler-4b]
Jupiter (6-15 times Earth size) [example: Kepler-6b]
Super giant (more than 15 times Earth size) [example: Kepler-13b]

3)Find and explore habitable planets (*habitable is the planet that can
host life -not necessarily human life* ) and Stars that can host habitable planets by certain criteria.


Basic Criteria of a Star Host to host a habitable planet :


-Spectral class of Star
The appropriate spectral range for habitable stars is considered to
be "late F" or "G", to "mid-K

and

- Metalicity of the star
Population I stars, or metal-rich  stars are young stars with the highest
metallicity out of all Star populations, and are more commonly found in the spiral arms
of the Milky Way galaxy. The Earth's Sun is an example of a metal-rich star
and is considered as an intermediate
We are looking for Population I star  metallicities ranging from approximately 1/10th to
three times that of the Sun (i.e. from dex= -0.05 up to dex= + ) .

Criteria For a Planet to be considered habitable

- The right temperature range of the exoplanet for there to be liquid water,
Life seems limited to a planet equilibrium temperature range of minus 15oC
(288K) to 115oC(388K). In this range, liquid water can still exist under certain
conditions.

and

- the right size and mass range to be able to have suitable atmosphere.

Size :Earth size planets (< 1.25 Earth radi)
      Super-Earth(1.25 - 2 times Earth radi)

and

*Super ideally but not mandatory  Mass should be between 1,5 - 0.0268*


4)Find stars with at least one planet in its habitable zone:

The app will calculate  the radius of the host star’s habitable zone boundaries with the
equations
1) Ri= Math.sqrt(Lstar/1.1)
 where Ri = the inner boundary of the habitable zone in astronomical units (AU)
 and Lstar is one of the tables columns and 1.1 is a stellar flux constant

2) Ro=Math.sqrt(Lstar/0.53)
where R0= the outer boundary of the habitable zone in astronomical units (AU)
and Lstar is one of the tables columns and 0.53 is also a stellar  flux constant

3)All planets in the star system with Planet_star_distance that falls between Ri-Ro
are planets within the habitable zone.



CRUD actions
Insert new found planets or object of interest
(using ,for example, Tess project candidates :
https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=TOI
or Kepler candidate planets:
https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=cumulative
or K2 candidate planets or even hypothetical planets)


Possible Extensions

Automatically update table.
ApI call with Wget to retrieve new CSV date as they are being updated online.
CRON will schedule weekly execution and sql-insert the new data from the
Nasa website (they have their Data Available Through an API)

________________________________________________________________________________
What is planitary habitability

https://en.wikipedia.org/wiki/Planetary_habitability

What is a habitable zone :

https://en.wikipedia.org/wiki/Circumstellar_habitable_zone
