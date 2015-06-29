class CreateUsersAndCommands < ActiveRecord::Migration
  def change
    create_table :users_commands, id:false do |t|
    	t.belongs_to :user, index: true
      t.belongs_to :command, index: true
    end
  end
end
