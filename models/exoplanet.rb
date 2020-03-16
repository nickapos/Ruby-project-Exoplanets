require_relative('../db/sql_runner')
require('pp')

class Exoplanet

  attr_accessor :loc_rowid, 
  :pl_hostname,
  :pl_name,
  :pl_discmethod,
  :pl_pnum,
  :pl_orbper,
  :gaia_dist,
  :st_teff,
  :st_mass,
  :st_rad,
  :pl_eqt,
  :pl_masse,
  :pl_rade,
  :pl_ratdor,
  :pl_disc,
  :pl_telescope,
  :pl_pelink,
  :pl_edelink,
  :st_spstr,
  :st_logg,
  :st_lum,
  :st_dens,
  :st_metfe,
  :st_metratio,
  :st_age

  def initialize( options )
    @loc_rowid = options['loc_rowid'].to_i
    @pl_hostname = options['pl_hostname']
    @pl_name = options['pl_name']
    @pl_discmethod = options['pl_discmethod']
    @pl_pnum = options['pl_pnum'].to_i
    @pl_orbper = options['pl_orbper'].to_f
    @gaia_dist = options['gaia_dist'].to_f
    @st_teff = options['st_teff'].to_f
    @st_mass = options['st_mass'].to_f
    @st_rad = options['st_rad'].to_f
    @pl_eqt = options['pl_eqt'].to_f
    @pl_masse = options['pl_masse'].to_f
    @pl_rade = options['pl_rade'].to_f
    @pl_ratdor = options['pl_ratdor'].to_f
    @pl_disc = options['pl_disc']
    @pl_telescope = options['pl_telescope']
    @pl_pelink = options['pl_pelink']
    @pl_edelink = options['pl_edelink']
    @st_spstr = options['st_sp']
    @st_logg = options['st_logg']
    @st_lum = options['st_lum'].to_f
    @st_dens = options['st_dens'].to_f
    @st_metfe = options['st_metfe'].to_f
    @st_metratio = options['st_metratio']
    @st_age = options['st_age'].to_f
  end



  def save()
    sql = "INSERT INTO exoplanets
    (
      pl_hostname,
      pl_name,
      pl_discmethod,
      pl_pnum,
      pl_orbper,
      gaia_dist,
      st_teff,
      st_mass,
      st_rad,
      pl_eqt,
      pl_masse,
      pl_rade,
      pl_ratdor,
      pl_disc,
      pl_telescope,
      pl_pelink,
      pl_edelink,
      st_spstr,
      st_logg,
      st_lum,
      st_dens,
      st_metfe,
      st_metratio,
      st_age)

    VALUES
    (
      $1,$2,$3, $4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24
    )
    RETURNING *"
    values = [@pl_hostname,
    @pl_name,
    @pl_discmethod,
    @pl_pnum,
    @pl_orbper,
    @gaia_dist,
    @st_teff,
    @st_mass,
    @st_rad,
    @pl_eqt,
    @pl_masse,
    @pl_rade,
    @pl_ratdor,
    @pl_disc,
    @pl_telescope,
    @pl_pelink,
    @pl_edelink,
    @st_spstr,
    @st_logg,
    @st_lum,
    @st_dens,
    @st_metfe,
    @st_metratio,
    @st_age]
    exoplanet_data = SqlRunner.run(sql, values)
    @loc_rowid = exoplanet_data.first()['loc_rowid'].to_i
  end

  def update()
    sql = "UPDATE exoplanets
    SET
    (
      pl_hostname,
      pl_name,
      pl_discmethod,
      pl_pnum,
      pl_orbper,
      gaia_dist,
      st_teff,
      st_mass,
      st_rad,
      pl_eqt,
      pl_masse,
      pl_rade,
      pl_ratdor,
      pl_disc,
      pl_telescope,
      pl_pelink,
      pl_edelink,
      st_spstr,
      st_logg,
      st_lum,
      st_dens,
      st_metfe,
      st_metratio,
      st_age)
    ) =
    (
      $1,$2,$3, $4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24
    )
    WHERE loc_rowid = $25"
    values = [@pl_hostname,
    @pl_name,
    @pl_discmethod,
    @pl_pnum,
    @pl_orbper,
    @gaia_dist,
    @st_teff,
    @st_mass,
    @st_rad,
    @pl_eqt,
    @pl_masse,
    @pl_rade,
    @pl_ratdor,
    @pl_disc,
    @pl_telescope,
    @pl_pelink,
    @pl_edelink,
    @st_spstr,
    @st_logg,
    @st_lum,
    @st_dens,
    @st_metfe,
    @st_metratio,
    @st_age]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM exoplanets
    WHERE loc_rowid = $1"
    values = [@loc_rowid]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM exoplanets"
    exoplanets = SqlRunner.run( sql )
    binding.pry
    result = exoplanets.map { |exoplanet| Exoplanet.new( exoplanet ) }
    return result
  end

  def self.find( loc_rowid )
     sql = "SELECT * FROM exoplanets
     WHERE loc_rowid = $1"
     values = [loc_rowid]
     exoplanet = SqlRunner.run( sql, values )
     result = Exoplanet.new( exoplanet.first )
     return result
   end

   def self.generic_find(find_column,find_value)
      sql ="select * from exoplanets

        where $1 like '%$2%' "

      values = [find_column,find_value]
     exoplanets =SqlRunner.run(sql,values)
     result=exoplanets.map {|exoplanet| Exoplanet.new(exoplanet)}
    return result
    end

    def self.find_planet_radius(pl_rade)
      sql = "SELECT * FROM exoplanets
      WHERE pl_rade = $1"
      values = [pl_rade]
      exoplanet = SqlRunner.run( sql, values )
      result = Exoplanet.new( exoplanet.first )
      return result
    end

    def self.find_by_size_category(lower_limit,upper_limit)
       sql ="select * from exoplanets
      where $1 <= pl_rade AND pl_rade <= $2;"
       values = [lower_limit,upper_limit]
      exoplanets =SqlRunner.run(sql,values)
      result=exoplanets.map {|exoplanet| Exoplanet.new(exoplanet)}
     return result
     end

     def find_earth_size_planets
       return self.find_by_size_category(0,1.25)
     end

     def find_super_earth_planets
       return self.find_by_size_category(1.25,2)
     end

     def find_mini_neptune_planets
       return self.find_by_size_category(2,4)
     end

     def find_neptune_size_planets
       return self.find_by_size_category(4,6)
     end

    def find_jupiter_size_planets
      return self.find_by_size_category(6,15)
    end

    def find_super_giants_planets
      return self.find_by_size_category(15,100)
    end

    def self.find_host_stars_that_could_host_habitable_wolds(lower_limit_metallicity,upper_limit_metalicity)
       sql ="select * from exoplanets
      where $1 <= st_metfe AND st_metfe <= $2
      AND st_spstr ~ '^F(8|9).*' OR
       st_spstr  ~ '^G[0-9].*' OR
        st_spstr  ~ '^K[0-5].*';"
       values = [lower_limit_metallicity,upper_limit_metalicity]
      exoplanets =SqlRunner.run(sql,values)
      result=exoplanets.map {|exoplanet| Exoplanet.new(exoplanet)}
     return result
   end

     def self.host_stars
      return self.find_host_stars_that_could_host_habitable_wolds(-0.05,0.1)
     end

     def self.find_habitable_exoplanets(lower_limit_pl_eqt,upper_limit_pl_eqt,lower_limit_pl_rade,upper_limit_pl_rade)
       sql ="select * from exoplanets
      where $1 <= pl_eqt AND pl_eqt <= $2
      AND $3 <= pl_rade AND pl_rade <= $4;"
       values = [lower_limit_pl_eqt,upper_limit_pl_eqt,lower_limit_pl_rade,upper_limit_pl_rade]
      exoplanets =SqlRunner.run(sql,values)
      result=exoplanets.map {|exoplanet| Exoplanet.new(exoplanet)}
     return result
   end

     def self.habitable_exoplanets
      return self.find_habitable_exoplanets(188.0,388.0,0,3.0)
     end

     def self.all()
       sql = "select * from exoplanets where
       pl_ratdor*st_rad*0.0046524726>=sqrt(abs(st_lum)/1.1)
       AND pl_ratdor*st_rad*0.0046524726<=sqrt(abs(st_lum)/0.53);"
       exoplanets = SqlRunner.run( sql )
       result = exoplanets.map { |exoplanet| Exoplanet.new( exoplanet ) }
       return result
     end


     end
