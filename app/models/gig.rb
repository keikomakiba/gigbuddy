class Gig < ApplicationRecord
    
  mount_uploader :image, ImageUploader
  paginates_per 10 
  default_scope -> { order(created_at: :desc) } #9/14追加

  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :artist, presence: true
  validates :place, presence: true
  validates :image, presence: true
end
