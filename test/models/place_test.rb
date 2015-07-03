# == Schema Information
#
# Table name: places
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  pcover_file_name    :string
#  pcover_content_type :string
#  pcover_file_size    :integer
#  pcover_updated_at   :datetime
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
