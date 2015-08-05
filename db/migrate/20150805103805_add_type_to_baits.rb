class AddTypeToBaits < ActiveRecord::Migration
  def change
    add_column :baits, :type, :string
  end
end
