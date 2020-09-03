class Purpose < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 30 }
  
 # validate  :start_not_before_end
  
  has_many :tasks, dependent: :destroy
  
  ####### reviews ###################
  has_many :reviews, dependent: :destroy
  has_many :review_users, through: :reviews, source: :user
  
  ####################################
 # def start_not_before_end
  #  errors.add(:end_day, "は開始日以降のものを選択してください")
  #end
end
