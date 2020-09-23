require './environment'
require 'pry'
module FormsLab


  class App < Sinatra::Base
    get '/' do
      erb :root
    end
    get '/new' do
      erb :'pirates/new'
    end
    post '/pirates' do
      #binding.pry
      
      #<input type="text" id="name" name="pirate[name] and the others">
      @pirate = Pirate.new(params[:pirate])
      
      #<input type="text" id="ship_name_1" name="pirate[ships][][name] and the others"
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :'pirates/show'
    end

  end
end
