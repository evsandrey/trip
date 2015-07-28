class AddGpsToTrophy < ActiveRecord::Migration
  def change
  	add_column :trophies, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :trophies, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
