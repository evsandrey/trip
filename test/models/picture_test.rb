# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  trip_id            :integer
#  name               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_meta         :text
#  lat                :decimal(10, 6)
#  lng                :decimal(10, 6)
#  pprivate           :boolean          default(FALSE)
#  ord                :integer          default(1000)
#

require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
