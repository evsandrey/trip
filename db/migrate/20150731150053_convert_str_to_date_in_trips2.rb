class ConvertStrToDateInTrips2 < ActiveRecord::Migration
  def change
  	change_column :trips, :edate, 'date USING to_date(sdate::text, \'MM/DD/YYYY\')'
  end
end
