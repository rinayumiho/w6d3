class MakeChangesUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    change_column :users, :name, :string, unique: true
  end
end
