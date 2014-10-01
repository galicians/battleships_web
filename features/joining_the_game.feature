Feature: Joining the game
	In order to play
	As a player
	I want to play against another player

	Scenario: Joining a game as the first player
		Given I register to Battleships
		Then I should see a waiting page

	Scenario: Joining when there is a player in the waiting list
	Given there is a player waiting
	When I register to Battleships
	Then I should see the button  to "Place my ships"