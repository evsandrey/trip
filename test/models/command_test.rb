# == Schema Information
#
# Table name: commands
#
#  id                 :integer          not null, primary key
#  name               :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class CommandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
