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
#

require 'test_helper'

class TrophyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
