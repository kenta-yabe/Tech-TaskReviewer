class Review < ApplicationRecord
  belongs_to :user
  belongs_to :purpose
  
   validates :content, presence: true, length: { maximum: 100 }
end
