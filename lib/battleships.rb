require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'ship'
require_relative 'water'
require_relative 'cell'

class Battleships < Sinatra::Base
 set :views, Proc.new { File.join(root, "..","views") }
 enable :sessions
  
  GAME = Game.new
  board = Board.new(Cell)

  water = Water.new
  board.grid.values.each {|cell| cell.content = water}
  board.grid.values.each {|cell| puts cell.content.inspect }


  get '/' do
  	erb :index
  end

  get '/sign_in' do
  	erb :sign_in
  end

  post '/sign_in' do
    if !GAME.player1
      first_player = Player.new
      first_player.name = params['name']
      GAME.add_player(first_player)
      redirect '/waiting_list'
    else
      second_player = Player.new
      second_player.name = params['name']
      GAME.add_player(second_player)
      redirect to '/waiting_list'
    end

  end 

  get '/waiting_list' do
    @player1 = GAME.player1
    @player2 = GAME.player2
    erb :waiting_list

  end

  get '/rules' do
    erb :rules
  end

  get '/board_player_one' do
    @board = board
  	erb :board_player_one
  end

  get '/board_player_two' do

  	erb :board_player_two
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
