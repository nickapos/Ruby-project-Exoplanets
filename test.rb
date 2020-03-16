require( 'pry-byebug' )
require('pp')

require_relative( './models/exoplanet.rb' )

@planets = Exoplanet.all
 # binding.pry

pp @planets
