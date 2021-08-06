class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string, null: false, default: ""
    add_column :users, :address, :string, null: false, default: ""
    add_column :users, :self_introduction, :text, null: false, default: ""
  end
end
