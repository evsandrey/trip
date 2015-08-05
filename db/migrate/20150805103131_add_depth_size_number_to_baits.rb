class AddDepthSizeNumberToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :depth, :float
    add_column :baits, :size, :integer
    add_column :baits, :number, :integer
  end
end
