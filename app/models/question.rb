class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :category
  accepts_nested_attributes_for :answers
end
