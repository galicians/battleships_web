require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class Battleships < Sinatra::Base
 set :views, Proc.new { File.join(root, "..","views") }
 enable :sessions
  
 game = Game.new


  get '/' do
  	erb :index
  end

  get '/sign_in' do
  	erb :sign_in
  end

  post '/sign_in' do
  	
  	if !session[:player1]
	  	player_one = Player.new 
	  	session[:player1] = params['name']
	  	player_one.name = params['name']
	  	game.add_player(player_one)
	  	puts session.inspect
	  	redirect '/waiting_list'
	else
		player_two = Player.new 
	  	session[:player2] = params['name']
	  	player_two.name = params['name']
	  	game.add_player(player_two)
	  	puts session.inspect
	  	redirect to '/waiting_list'
	 end
  	
  end

  get '/waiting_list' do

    erb :waiting_list

  end

  get '/rules' do
    erb :rules
  end

  get '/board_player_one' do

  	erb :board_player_one
  end

  get '/board_player_two' do

  	erb :board_player_two
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
