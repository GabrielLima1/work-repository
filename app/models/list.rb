class List < ApplicationRecord
  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  belongs_to :user
  # has_many :works, :dependent => :destroy
  # accepts_nested_attributes_for :works
  # has_many :favorites
  # validates_presence_of :name
end
