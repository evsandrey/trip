class AddAttachmentPcoverToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :pcover
    end
  end

  def self.down
    remove_attachment :places, :pcover
  end
end
