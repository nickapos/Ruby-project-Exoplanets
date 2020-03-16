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

 post '/result_presentation' do
   user_input=params[:find_operation]
   if user_input == "host_stars"
     @planets = Exoplanet.host_stars
    elsif user_input == "habitable_exoplanets"
    @planets = Exoplanet.habitable_exoplanets
      end

   erb( :result_presentation )
 end

 get '/result_details/:id' do
   @planet =Exoplanet.find(params[:id].to_i)
   erb(:result_details)
 end

 get '/delete/:id' do
   @planet =Exoplanet.find(params[:id].to_i)
   @planet.delete
   erb(:delete)
 end

 get '/insert' do
   erb(:insert)
 end



# get '/pizza-orders/:id' do # show
#   @order = PizzaOrder.find( params[:id] )
#   erb( :show )
# end
#
# post '/pizza-orders' do # create
#   @order = PizzaOrder.new( params )
#   @order.save()
#   erb( :create )
# end
#
# get '/pizza-orders/:id/edit' do # edit
#   @order = PizzaOrder.find( params[:id] )
#   erb( :edit )
# end
#
# post '/pizza-orders/:id' do # update
#   PizzaOrder.new( params ).update
#   redirect to '/pizza-orders'
# end
#
# post '/pizza-orders/:id/delete' do # delete
#   order = PizzaOrder.find( params[:id] )
#   order.delete()
#   redirect to '/pizza-orders'
# end
