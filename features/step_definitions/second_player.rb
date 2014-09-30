
Given(/^a player has already sign in$/) do
	player_one = Player.new 
end

When(/^a second player is in the homepage$/) do
	visit '/'
end

And(/^second player fill in "(.*?)" with "(.*?)"$/) do |field, text|
	fill_in field, with: text
end













# Given(/^I am on the homepage$/) do
#   visit '/'
# end


# When(/^I follow "(.*?)"$/) do |link|
# 	click_link link
# end

# When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
# 	fill_in field, with: text

# end

# When(/^I click on "(.*?)"$/) do |name|
# 	click_button name
# end

# Then(/^I should see "(.*?)"$/) do |name|
# 	expect(page).to have_content 'Pablo, you are waiting for a second player'
# end
