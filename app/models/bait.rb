# == Schema Information
#
# Table name: baits
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Bait < ActiveRecord::Base
	has_many :trophy
	has_attached_file :photo,
	  	styles: { thumb: "50x50#", med: "150x150#"},
	  	:path => "trip-site/bait/:style/:id.:extension",
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
