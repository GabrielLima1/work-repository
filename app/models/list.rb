# == Schema Information
#
# Table name: lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  visibility :string
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  belongs_to :user
  validates_presence_of :name, notice: "Ops! Preencha esse aqui!"
end
