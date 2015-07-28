class AddManufacturerIdToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :manufacturer_id, :integer
  end
end
