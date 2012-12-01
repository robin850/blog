class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :introduction
      t.text :body
      t.references :category
      t.references :user

      t.timestamps
    end
    add_index :articles, :category_id
    add_index :articles, :user_id
  end
end
