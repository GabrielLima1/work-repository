class List < ApplicationRecord
  belongs_to :user
  has_many :works, inverse_of: :list
  accepts_nested_attributes_for :works
  has_many :favorites

  validates_presence_of :name
end
