Given /^I have an article$/ do
  @article = FactoryGirl.create(:article)
end

Then /^a link to see more$/ do
  page.should have_content("suite")
end


Given /^I have no articles$/ do
  Article.delete_all
end

When /^I go to the new action$/ do
  visit new_article_path
  current_path.should == new_article_path
end

Then /^I should have (\d+) article$/ do |nb|
  Article.count.should eq(nb.to_i)
end

Then /^I should be on the article's page$/ do
  current_path.should == "/articles/#{@article.slug}"
end

Given /^I have no comments$/ do
  Comment.delete_all
end

Then /^I should have (\d+) comment$/ do |nb|
  Comment.count.should eq(nb.to_i)
end

Given /^I have a comment$/ do
  steps %{
    When I go to the article's page
    Then I fill in "Votre nom" with "John"
    Then I fill in "E-mail" with "john@doe.net"
    Then I fill in "Votre commentaire" with "Hello"
    Then I click on "Envoyer"
  }
end

When /^I go to the article's page$/ do
  visit article_path(@article)
end

Given /^I have the following articles?$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:article, hash)
  end
end
