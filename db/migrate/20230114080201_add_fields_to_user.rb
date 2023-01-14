class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :roll_no, :string
    add_column :users, :college, :string
    add_column :users, :role_id, :integer
  end
end
