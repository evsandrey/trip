class CreateTrophies < ActiveRecord::Migration
  def change
    create_table :trophies do |t|
      t.integer :fish_id
      t.integer :trip_id
      t.float :weight

      t.timestamps null: false
    end
  end
end
