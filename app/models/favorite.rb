# == Schema Information
#
# Table name: favorites
#
#  id         :bigint(8)        not null, primary key
#  list_id    :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ApplicationRecord
  belongs_to :list
  belongs_to :user
end
