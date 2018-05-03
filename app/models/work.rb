class Work < ApplicationRecord
  belongs_to :list
  has_many :sub_works, dependent: :destroy
  accepts_nested_attributes_for :sub_works, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  # has_many :sub_work

  # validates_presence_of :name, message: "Ops! Preencha esse aqui!"
end
