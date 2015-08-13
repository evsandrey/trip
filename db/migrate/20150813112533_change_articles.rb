class ChangeArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :text
    add_column :articles, :text, :text
  end
end
