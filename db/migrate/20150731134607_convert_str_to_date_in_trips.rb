class ConvertStrToDateInTrips < ActiveRecord::Migration
  def change
  	change_column :trips, :sdate, 'date USING to_date(sdate::text, \'MM/DD/YYYY\')'
  end
end
