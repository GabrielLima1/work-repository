# == Schema Information
#
# Table name: sub_works
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  status     :boolean
#  work_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SubWork, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
