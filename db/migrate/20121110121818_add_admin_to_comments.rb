class AddAdminToComments < ActiveRecord::Migration
  def change
    add_column :comments, :admin, :boolean, :default => false
  end
end
