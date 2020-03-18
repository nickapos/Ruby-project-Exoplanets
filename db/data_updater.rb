require('csv')
require('pry')
require('pp')
require('../models/exoplanet.rb')


  counter=0
 table = CSV.parse(File.read("planets-api.csv"), headers: true)
 table.each do |planet|
   new_planet= Exoplanet.new(planet)
   exoplanet_from_db=new_planet.exists_in_db
   if exoplanet_from_db.nil?
     new_planet.save
     counter = counter+1
   end
  end

  puts "#{counter} number of planets have been inserted"


 # pp table[0]
