Feature: Visiting the homepage
	In order to know what this is all about
	As a casual web surfer
	I want to know more about Battleships

	Scenario: Welcome
		Given I want to do something fun
		When I am on the homepage
		Then I should see "Welcome to Battleships"
