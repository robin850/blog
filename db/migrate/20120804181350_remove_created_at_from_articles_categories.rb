class RemoveCreatedAtFromArticlesCategories < ActiveRecord::Migration
  def up
    remove_column :articles_categories, :created_at
  end

  def down
    add_column :articles_categories, :created_at, :datetime
  end
end
