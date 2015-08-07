class AddAttachmentPhotoToCommands < ActiveRecord::Migration
  def self.up
    change_table :commands do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :commands, :photo
  end
end
