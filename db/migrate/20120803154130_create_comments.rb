class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user
      t.references :article

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :article_id
  end
end
