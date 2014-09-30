Feature: Joining the game
	In order to play
	As a player
	I want to join another player

	Scenario: Joining a game
		Given I am on the homepage
		When I follow "sign in"
		And I fill in "name" with "Pablo"
		And I click on "Play"
		Then I should see "Pablo, you are waiting for a second player"
