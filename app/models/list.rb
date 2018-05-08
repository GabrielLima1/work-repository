class List < ApplicationRecord
  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  belongs_to :user
  validates_presence_of :name, notice: "Ops! Preencha esse aqui!"
end
