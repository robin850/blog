Given(/^I have an? (.*?)$/) do |model|
  FactoryGirl.create(:"#{model}")
end

Given(/^I have no (.*?)$/) do |model|
  if model != "deliveries"
    model = model.singularize.camelize.constantize
    model.delete_all
    model.count.should eq(0)
  else
    ActionMailer::Base.deliveries = []
  end
end

Then(/^I should have (\d+) (.*?)$/) do |nb, model|
  model = model.singularize.camelize.constantize
  model.count.should eq(nb.to_i)
end
