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
#

class Picture < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip
	
    has_attached_file :photo,
	  	styles: {thumb: "50x50#", med: "300x300#"},
	  	:path => "trip-site/:attachment/:id/:style.:extension",
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  	
end
