require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( './models/exoplanet.rb' )
also_reload( './models/*' )

get '/' do

  erb( :index )
end

get '/search' do

  erb( :search )
end

get '/documentation' do
  erb( :documentation)
end

 post '/result_presentation' do
   user_input=params[:find_operation]
   if user_input == "host_stars"
     @planets = Exoplanet.host_stars
    elsif user_input == "habitable_exoplanets"
    @planets = Exoplanet.habitable_exoplanets
  elsif user_input=="earth_size_planets"
    @planets=Exoplanet.find_earth_size_planets
  elsif user_input=="superearth_size_planets"
    @planets=Exoplanet.find_super_earth_planets
  elsif user_input=="mini_neptune_size_planets"
    @planets=Exoplanet.find_mini_neptune_planets
  elsif user_input=="neptune _size_planets"
    @planets=Exoplanet.find_neptune_size_planets
  elsif user_input=="jupiter_size_planets"
    @planets=Exoplanet.find_jupiter_size_planets
  elsif user_input=="super_giant_size_planets"
    @planets=Exoplanet.find_super_giants_planets
  elsif user_input=="planets_in_habitable_zone"
    @planets=Exoplanet.find_planets_in_habitable_zone
  elsif user_input=="retrieve_all_planets"
    @planets=Exoplanet.all

      end

   erb( :result_presentation )
 end

 get '/result_details/:id' do
   @planet =Exoplanet.find(params[:id].to_i)
   erb(:result_details)
 end

 get '/delete/:id' do
   @planet =Exoplanet.find(params[:id].to_i)
   # binding.pry
   @planet.delete
   erb(:delete)
 end

 get '/insert' do
   erb(:insert)
 end

 post '/insert_action' do
   @planet =Exoplanet.new(params)
   @planet.save
   erb(:insert_action)
 end

 get '/update/:id' do
   @planet =Exoplanet.find(params[:id].to_i)
   erb(:update)
 end

 post '/update_action' do
   @planet =Exoplanet.new(params)
   @planet.update
   erb(:update_action)
 end
