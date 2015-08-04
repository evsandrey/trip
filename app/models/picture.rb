# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  trip_id            :integer
#  name               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_meta         :text
#  lat                :decimal(10, 6)
#  lng                :decimal(10, 6)
#

class Picture < ActiveRecord::Base
	
	@exif_date_format = '%Y:%m:%d %H:%M:%S'
	
	belongs_to :user
	belongs_to :trip
	
    has_attached_file :photo,
	  	styles: { med: "150x150", slide: "x300" },
	  	:path => "trip-site/photo/:style/:filename.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	after_photo_post_process  :post_process_photo 

	def post_process_photo
	  imgfile = EXIFR::JPEG.new(photo.queued_for_write[:original].path)
	  return unless imgfile
	  if !imgfile.gps.nil? 
	  	self.lat = imgfile.gps.latitude
	  	self.lng = imgfile.gps.longitude	
	  end
	  if !imgfile.date_time.nil? 
	  	self.created_at = imgfile.date_time
	  end


  	end
end
