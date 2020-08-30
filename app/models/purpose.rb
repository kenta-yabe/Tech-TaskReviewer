class Purpose < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 30 }
  
  has_many :tasks, dependent: :destroy
  
  ####### reviews ###################
  has_many :reviews, dependent: :destroy
  has_many :review_users, through: :reviews, source: :user
end
