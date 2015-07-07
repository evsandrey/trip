class AddAttachmentPhotoToBaits < ActiveRecord::Migration
  def self.up
    change_table :baits do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :baits, :photo
  end
end
