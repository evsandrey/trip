class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :trip_id
      t.text :name

      t.timestamps null: false
    end
  end
end
