When /^I go to the categories new page$/ do
  visit "/categories/new"
end

Given /^I have no category$/ do
  Category.delete_all
  Category.count.should eq(0)
end

Then /^I should have (\d+) categories$/ do |nb|
  Category.count.should eq(nb.to_i)
end
