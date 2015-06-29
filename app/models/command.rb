# == Schema Information
#
# Table name: commands
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Command < ActiveRecord::Base
	has_and_belongs_to_many :users
end
