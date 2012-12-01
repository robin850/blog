class RemoveUpdatedAtFromArticlesCategories < ActiveRecord::Migration
  def up
    remove_column :articles_categories, :updated_at
  end

  def down
    add_column :articles_categories, :updated_at, :datetime
  end
end
