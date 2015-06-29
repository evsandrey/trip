class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
