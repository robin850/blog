class RemoveCategoryIdFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :category_id
  end

  def down
  end
end
