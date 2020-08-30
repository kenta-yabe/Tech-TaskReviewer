class Purpose < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 30 }
  
  has_many :tasks
  
  ####### reviews ###################
  has_many :reviews
  has_many :review_users, through: :reviews, source: :user
end
