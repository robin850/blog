Then(/^a link to see more$/) do
  page.should have_content("suite")
end

When(/^I go to the new action$/) do
  visit new_article_path
  current_path.should == new_article_path
end

Given(/^I create a comment$/) do
  steps %{
    When I go to the article's page
    Then I fill in "Votre nom" with "John"
    Then I fill in "E-mail" with "john@doe.net"
    Then I fill in "Votre commentaire" with "Hello"
    Then I submit the form
  }
end

When(/^I go to the article's page$/) do
  visit article_path(Article.last)
end

Given(/^I have the following articles?$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:article, hash)
  end
end
