class AddAttachmentPhotoToRewards < ActiveRecord::Migration
  def self.up
    change_table :rewards do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :rewards, :photo
  end
end
