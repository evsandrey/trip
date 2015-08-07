class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :name
      t.integer :text

      t.timestamps null: false
    end
  end
end
