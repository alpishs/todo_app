class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :projectmanager_role, :boolean, default: false
    add_column :users, :developer_role, :boolean, default: false
  end
end
