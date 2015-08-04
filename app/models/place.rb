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
#  lat                 :decimal(10, 6)
#  lng                 :decimal(10, 6)
#

class Place < ActiveRecord::Base
	has_many :trips
	
	has_attached_file :pcover,
	  	styles: { thumb: "50x50", med: "100x100", grid: "300x300"},
	  	:path => "trip-site/place/:style/:id.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :pcover, :content_type => /\Aimage\/.*\Z/
end
