class AddAttachmentPhotoToManufacturers < ActiveRecord::Migration
  def self.up
    change_table :manufacturers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :manufacturers, :photo
  end
end
