class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
