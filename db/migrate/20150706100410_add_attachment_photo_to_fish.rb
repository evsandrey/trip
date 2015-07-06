class AddAttachmentPhotoToFish < ActiveRecord::Migration
  def self.up
    change_table :fish do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :fish, :photo
  end
end
