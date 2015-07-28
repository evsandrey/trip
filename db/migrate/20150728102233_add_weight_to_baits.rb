class AddWeightToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :weight, :integer
  end
end
