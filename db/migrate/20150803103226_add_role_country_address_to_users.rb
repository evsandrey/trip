class AddRoleCountryAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "user"
    add_column :users, :country, :string, :default => "RU"
    add_column :users, :address, :string
  end
end
