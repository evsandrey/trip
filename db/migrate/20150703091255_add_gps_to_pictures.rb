class AddGpsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :pictures, :lng, :decimal, {:precision=>10, :scale=>6}

  end
end
