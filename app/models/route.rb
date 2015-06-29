# == Schema Information
#
# Table name: routes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Route < ActiveRecord::Base
	belongs_to :trip
end
