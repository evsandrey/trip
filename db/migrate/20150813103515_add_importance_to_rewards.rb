class AddImportanceToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :importance, :integer, default: 0
  end
end
