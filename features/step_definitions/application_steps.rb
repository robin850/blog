When /^I go to the the index action$/ do
  visit "/articles"
  current_path.should eq(articles_path)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in field, :with => value
end

Then /^I click on "(.*?)"$/ do |elem|
  click_button elem
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end

Then /^I choose "(.*?)"$/ do |elem|
  choose(elem) 
end

Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^I am an admin user$/ do
  email = 'foo@bar.net'
  password = 'secret'
  User.new(:email => email, :password => password, :password_confirmation => password, :admin => true).save!

  visit '/users/sign_in'
  within("form") do
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
  end
  click_button "Sign in"
end

Then /^I follow "(.*?)"$/ do |link|
  click_link link
end