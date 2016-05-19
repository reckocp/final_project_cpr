Given(/^I have an existing account$/) do
  user = User.create!(
    username: "theironyard",
    email: "test@theironyard.com",
    password: "password",
    street: "1801 Rio Grande St",
    city: "Austin",
    state: "TX",
    zip: "78701",
    party: "Fun",
    admin: false,
  )
end
When(/^I go to the root path$/) do
  visit('/')
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

When(/^I fill in "([^"]*)" with "([^"]*)" within "([^"]*)"$/) do |field, content, parent|
  within(parent) { fill_in(field, with: content) }
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^I should see "([^"]*)"$/) do |text|
  assert page.has_content?(text)
end
When(/^I press "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

When(/^I press "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
  within(arg2) { click_button(arg1) }
end 
