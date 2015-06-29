class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.integer :captain
      t.integer :route_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
