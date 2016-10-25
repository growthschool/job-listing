# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  job_id     :integer
#  content    :text
#

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
