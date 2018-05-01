class Work < ApplicationRecord
  belongs_to :list
  has_many :sub_work

  validates_presence_of :name, message: "Ops! Preencha esse aqui!"
end
