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

class SubWork < ApplicationRecord
  belongs_to :work

  # validates_presence_of :name, message: "Ops! Preencha esse aqui!"
end
