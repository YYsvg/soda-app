class AddRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :boolean, default: false, null: false
  end
end
