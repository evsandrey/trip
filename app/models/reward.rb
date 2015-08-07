# == Schema Information
#
# Table name: rewards
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  trip_id     :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reward < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip
	
	validates :user_id, :presence => true
	validates :trip_id, :presence => true
	
	has_attached_file :photo,
	  	styles: { thumb: "50x50#", med: "100x100#", grid: "300x300#"},
	  	:path => "trip-site/rewards/:style/:id.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :pcover, :content_type => /\Aimage\/.*\Z/
end
