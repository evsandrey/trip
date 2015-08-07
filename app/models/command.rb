# == Schema Information
#
# Table name: commands
#
#  id                 :integer          not null, primary key
#  name               :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Command < ActiveRecord::Base
	has_and_belongs_to_many :users, :uniq => true, :join_table => :users_commands
	has_attached_file :photo,
	  	styles: { badge: "10x10#", thumb: "50x50#", med: "300x300#"},
	  	:path => "trip-site/commands/:style/:id.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
