Feature: Joining the game
	In order to have some fun
	As a player
	I want to join a game

	Scenario: Joining a game
		Given I am on the homepage
		When I follow "sign in"
		And I fill in "name" with "Mihai"
		And I click on "Play"
		Then I should see "Your board Mihai"
