class Purpose < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 30 }
  
  has_many :tasks
end
