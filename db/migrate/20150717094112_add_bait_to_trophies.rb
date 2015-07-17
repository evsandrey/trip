class AddBaitToTrophies < ActiveRecord::Migration
  def change
    add_column :trophies, :bait_id, :integer
  end
end
