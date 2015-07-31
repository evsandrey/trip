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
end
