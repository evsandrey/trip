class AddOrdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :ord, :integer, default: 1000
  end
end
