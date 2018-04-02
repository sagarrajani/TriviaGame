class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attempts
  has_many :questions, :through => :attempts,  dependent: :destroy
  has_many :evaluations, class_name: "Reputation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :questins}, aggregated_by: :sum

end
