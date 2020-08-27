class Task < ApplicationRecord
  belongs_to :purpose
  
  validates :content, presence: true, length: { maximum: 100 }
end
