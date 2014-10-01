
Given(/^I register to Battleships$/) do 
	 visit '/'
	 click_link('Sign in')
	 fill_in('name', :with => 'name')
	 click_button('Register')
end

Then(/^I should see a waiting page$/) do
	visit ('/waiting_list')
end

Given(/^there is a player waiting$/) do
	first_player = Player.new	#why not @player1 = GAME.player1
end

Then(/^I should see the button  to "(.*?)"$/) do |button|
	click_button('Player 2 Place your ships')
end



