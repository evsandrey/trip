class AddBtypeToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :btype, :string
    remove_column :baits, :type
  end
end
