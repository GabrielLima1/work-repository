# == Schema Information
#
# Table name: works
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  status     :boolean
#  list_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Work, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
