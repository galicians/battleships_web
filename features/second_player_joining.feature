Feature: Joining the game
	In order to have some fun
	As a player
	I want to join a game

	Scenario: Second player joining
		Given a player has already sign in
		When a second player is in the homepage
		And second player fill in "name" with "Elena"
		
