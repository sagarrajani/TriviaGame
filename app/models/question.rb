class Question < ApplicationRecord
  belongs_to :user
  has_many :attempts, dependent: :delete_all
  has_many :users, :through => :attempts
  acts_as_taggable
  has_reputation :votes, source: :user, aggregated_by: :sum
  validates :question, presence: true, length: {minimum: 3, maximum: 300}
  validates :answer, presence: true, length: {minimum: 1, maximum: 50}
  validates :tag_list, presence: true
end
