Feature: Joining the game
	In order to play
	As a player
	I want to play against another player

	Scenario: Joining a game
		Given I am on the homepage
		When I click on "sign in"
		And I fill in "name" with "Pablo"
		And I click on "Play"
		Then I should be placed on the "waiting list"
