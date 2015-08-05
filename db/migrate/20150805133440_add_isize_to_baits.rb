class AddIsizeToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :isize, :float
  end
end
