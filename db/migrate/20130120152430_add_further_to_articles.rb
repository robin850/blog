class AddFurtherToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :further, :boolean
  end
end
