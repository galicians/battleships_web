When(/^I follow "(.*?)"$/) do |link|
	click_link link
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
	fill_in field, with: text

end

When(/^I click on "(.*?)"$/) do |name|
	click_button name
end

Then(/^I should see the board$/) do
	expect(page).to have_content 'Your board'
end
