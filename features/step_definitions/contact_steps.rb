When(/^I go to the contact page$/) do
  visit "/contact"
end

Then(/^I have (\d+) deliver(y|ies)$/) do |nb, _|
  ActionMailer::Base.deliveries.length.should eq(nb.to_i)
end
