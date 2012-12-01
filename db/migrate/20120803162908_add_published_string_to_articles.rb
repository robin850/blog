class AddPublishedStringToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :string
  end
end
