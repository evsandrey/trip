class CreateBaits < ActiveRecord::Migration
  def change
    create_table :baits do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end