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
#  sdesc              :text
#  sdate              :date
#  edate              :date
#

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
