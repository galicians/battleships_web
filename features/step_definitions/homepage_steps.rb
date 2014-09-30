
Given(/^I want to do something fun$/) do
end

When(/^I am on the homepage$/) do
	visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
	expect(page).to have_content text
end