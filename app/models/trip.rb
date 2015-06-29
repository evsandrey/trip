# == Schema Information
#
# Table name: trips
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  captain            :integer
#  route_id           :integer
#  place_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

class Trip < ActiveRecord::Base
	has_and_belongs_to_many :users, :uniq => true, :join_table => :users_trips
	has_one :route
	has_one :place
	has_many :pictures

	has_attached_file :cover,
	  	styles: {thumb: "50x50#", med: "300x300#"},
	  	:path => "trip-site/trip:attachment/:id/:style.:extension",
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
