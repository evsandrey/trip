class AddSdescToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :sdesc, :text
  end
end
