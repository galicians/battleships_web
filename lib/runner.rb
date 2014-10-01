require './cell'
require './board'
require './game'
require './player'
require './ship'
require './water'
require './game'

def loading
	
	@board = Board.new(Cell)
	@water = Water.new
	@board.grid.values.each {|cell| cell.content = @water }
	@game = Game.new
	@first_player = Player.new
	@second_player = Player.new
	@game.add_player(@first_player)
	@game.add_player(@second_player)

	@submarine = Ship.submarine
	@carrier = Ship.aircraft_carrier
	@destroyer = Ship.destroyer
	@battleship = Ship.battleship
	@patrol = Ship.patrol_boat

	@board.place(@destroyer,:C2)
	@board.place(@submarine,:J3)
	@board.place(@carrier,:A4)
	#board.place(patrol, :D2) 6 ceel occupied
end

loading

#to see the board @board.grid.values.each {|cell| puts cell.content.inspect }