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
#  weight             :integer
#  manufacturer_id    :integer
#  depth              :float
#  size               :integer
#  number             :integer
#  type               :string
#

class Bait < ActiveRecord::Base
	TYPES = %i[Воблер Резина Колебло Вертушка Муха]
	SIZES = %i[один два три четыре пять]



	validates :description, :presence => true
	validates :name, :presence => true
	validates :weight, :presence => true
	validates :manufacturer_id, :presence => true
	validates_numericality_of :weight
	



	has_many :trophy, dependent: :destroy
	belongs_to :manufacturer
	has_attached_file :photo,
	  	styles: { thumb: "50x50", med: "150x150"},
	  	:path => "trip-site/bait/:style/:id.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
