class Bait < ActiveRecord::Base
	has_attached_file :photo,
	  	styles: { med: "150x150#"},
	  	:path => "trip-site/:attachment/:style/:id.:extension",
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
