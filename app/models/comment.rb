class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gig
    
  validates :content, presence: true
end
