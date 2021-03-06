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
#  btype              :string
#  isize              :float
#

class Bait < ActiveRecord::Base
	TYPES = %i[Колебло Воблер Резина Вертушка Муха Поппер Лягуха Пилкер]
	SIZES = %i[один два три четыре пять]



	validates :description, :presence => true
	validates :btype, :presence => true
	validates :name, :presence => true
	validates :manufacturer_id, :presence => true
	
	has_many :trophy, dependent: :destroy
	belongs_to :manufacturer
	has_attached_file :photo,
	  	styles: { thumb: "50x50", med: "300x300"},
	  	:path => "trip-site/bait/:style/:id.:extension",
	    :storage => :dropbox,
    	:dropbox_visibility => 'public',
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	def photo_url
    	photo.url(:med)
  	end
end
