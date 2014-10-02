require './cell'
require './board'
require './game'
require './player'
require './ship'
require './water'
require './game'

def loading
	
	@board1 = Board.new(Cell)
	@board2 = Board.new(Cell)
	@water = Water.new
	@board1.grid.values.each {|cell| cell.content = @water }
	@board2.grid.values.each {|cell| cell.content = @water }
	@game = Game.new
	@first_player = Player.new
	@second_player = Player.new
	@game.add_player(@first_player)
	@game.add_player(@second_player)

	@first_player.board = @board1
	@second_player.board = @board2

	@submarine = Ship.submarine
	@carrier = Ship.aircraft_carrier
	@destroyer = Ship.destroyer
	@battleship = Ship.battleship
	@patrol = Ship.patrol_boat
	#board.place(patrol, :D2) 6 ceel occupied
	@board1.place(@destroyer,:C2)
	@board1.place(@submarine,:J3)
	@board1.place(@carrier,:A4)
	@board2.place(@destroyer,:C2)
	@board2.place(@submarine,:J3)
	@board2.place(@carrier,:A4)
	
end

loading

#to see the board @board.grid.values.each {|cell| puts cell.content.inspect }