class AddPhotoMetaToPicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :photo_meta, :text
  end
end
