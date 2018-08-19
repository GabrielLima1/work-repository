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

class Work < ApplicationRecord
  belongs_to :list
  has_many :sub_works, dependent: :destroy
  accepts_nested_attributes_for :sub_works, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  default_value_for :status, false
  # has_many :sub_work

  # validates_presence_of :name, message: "Ops! Preencha esse aqui!"
end
