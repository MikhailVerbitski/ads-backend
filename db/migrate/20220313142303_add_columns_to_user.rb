class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :build, :string
    add_column :users, :apartment, :string
    add_column :users, :post_code, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
