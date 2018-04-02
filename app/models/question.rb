class Question < ApplicationRecord
  belongs_to :user
  has_many :questions_categories
  has_many :categories, :through => :questions_categories
  has_many :attempts
  has_many :users, :through => :attempts
  acts_as_taggable
end
