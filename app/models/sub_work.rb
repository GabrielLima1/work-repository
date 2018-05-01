class SubWork < ApplicationRecord
  belongs_to :work

  # validates_presence_of :name, message: "Ops! Preencha esse aqui!"
end
