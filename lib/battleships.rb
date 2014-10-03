require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'ship'
require_relative 'water'
require_relative 'cell'

class Battleships < Sinatra::Base
 set :views, Proc.new { File.join(root, "..","views") }
 set :public_folder, 'public'
 enable :sessions
 #set :public folder for css
  
  GAME = Game.new
  board1 = Board.new(Cell)
  board2 = Board.new(Cell)
  first_player = Player.new
  second_player = Player.new
  first_player.board = board1
  second_player.board = board2

  water = Water.new
  board1.grid.values.each {|cell| cell.content = water}
  board2.grid.values.each {|cell| cell.content = water}


  get '/' do
    puts session.inspect
  	erb :index
  end

  get '/sign_in' do
    puts session.inspect
  	erb :sign_in
  end

  post '/sign_in' do
    if !GAME.player1
      first_player.name = params['name']
      session["player1"] = params['name']
      puts session.inspect
      GAME.add_player(first_player)
      redirect '/waiting_list'
    else
      second_player.name = session[:session_id]
      second_player.name = params['name']
      session["player2"] = params['name']
      puts session.inspect
      GAME.add_player(second_player)
      redirect to '/waiting_list'
    end

  end

  post '/place_ships_player_one' do
    
    ship = {"carrier" => Ship.aircraft_carrier,
            "battleship" => Ship.battleship,
            "destroyer" => Ship.destroyer,
            "submarine" => Ship.submarine,
            "patrol_boat" => Ship.patrol_boat}

    session[params["type_ship"]] = 'placed'
    board1.place(ship[params["type_ship"]],params[:coord].to_sym,params[:orientation].to_sym)

    @board1 = board1
    @board2 = board2
    @game = GAME
    return redirect '/place_shoot_player_one'if board1.ships_count == 5
    # send_file 'water.jpg', :type => :jpg
    erb :board_player_one
  end

  post '/place_ships_player_two' do
    
    ship = {"carrier" => Ship.aircraft_carrier,
            "battleship" => Ship.battleship,
            "destroyer" => Ship.destroyer,
            "submarine" => Ship.submarine,
            "patrol_boat" => Ship.patrol_boat}
          
    session["#{params["type_ship"]+2.to_s}"] = 'placed'
    board2.place(ship[params["type_ship"]],params[:coord].to_sym,params[:orientation].to_sym)

    @board1 = board1
    @board2 = board2
    @game = GAME
    return redirect '/place_shoot_player_two'if board2.ships_count == 5
    erb :board_player_two
  end



     get '/place_shoot_player_one' do
      @board1 = board1
      @board2 = board2 
      erb :player_one_sea
    end

    get '/place_shoot_player_two' do
      @board1 = board1
      @board2 = board2 
      erb :player_two_sea
    end


  post '/place_shoot_player_one' do
    
    GAME.shoots(params[:coord].to_sym)
    @board2 = board2
    @board1 = board1
    @game = GAME
    erb :player_one_sea
  end

  post '/place_shoot_player_two' do
    
    GAME.shoots(params[:coord].to_sym)
    @board2 = board2
    @board1 = board1
    @game = GAME
    erb :player_two_sea
  end



  get '/waiting_list' do
    @player1 = GAME.player1
    @player2 = GAME.player2
    erb :waiting_list

  end


  get '/board_player_one' do
    @board1 = board1
  	erb :board_player_one
  end

  get '/board_player_two' do
    @board2 = board2
  	erb :board_player_two
  end


   get '/test' do
      erb :test
    end

    post '/test' do
      puts "in test #{params}"
      erb :test
    end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
