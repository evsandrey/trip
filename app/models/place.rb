# == Schema Information
#
# Table name: places
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  pcover_file_name    :string
#  pcover_content_type :string
#  pcover_file_size    :integer
#  pcover_updated_at   :datetime
#

class Place < ActiveRecord::Base
	has_many :trips
	has_attached_file :pcover,
	  	styles: { thumb: "50x50#", med: "150x150#"},
	  	:path => "trip-site/places/:attachment/:style/:id.:extension",
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :pcover, :content_type => /\Aimage\/.*\Z/
end
