class Changedatetimeformat < ActiveRecord::Migration
  def up
    change_column :trips, :sdate, :string
    change_column :trips, :edate, :string
  end

  def down
    change_column :trips, :sdate, :date
    change_column :trips, :edate, :date
  end
end
