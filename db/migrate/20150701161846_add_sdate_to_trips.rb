class AddSdateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :sdate, :datetime
    add_column :trips, :edate, :datetime
  end
end
