Given /^I have no deliveries$/ do
  ActionMailer::Base.deliveries = []
end

When /^I go to the contact page$/ do
  visit "/contact"
end

Then /^I should have (\d+) deliver(y|ies)$/ do |nb, foo|
  ActionMailer::Base.deliveries.length.should eq(nb.to_i)
end

