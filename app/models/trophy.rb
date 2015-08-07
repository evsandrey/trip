# == Schema Information
#
# Table name: trophies
#
#  id         :integer          not null, primary key
#  fish_id    :integer
#  trip_id    :integer
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  bait_id    :integer
#  lat        :decimal(10, 6)
#  lng        :decimal(10, 6)
#  proof_id   :integer
#

class Trophy < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip
	belongs_to :fish
	belongs_to :bait

	validates :user_id, :presence => true
	validates :weight, :presence => true
	validates :fish_id, :presence => true
	validates :trip_id, :presence => true
	validates :bait_id, :presence => true
    validates_numericality_of :weight

	
end
