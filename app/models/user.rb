class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    before_validation { email.downcase! }
    has_secure_password
    
    validates :password, presence: true, length: { minimum: 6 }
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 100 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    # validates :image, presence: true
    validates :image, presence: true
    
    has_many :gigs, dependent: :destroy
    has_many :participants, dependent: :destroy
    has_many :participant_gigs, through: :participants, source: :gig
    has_many :comments, dependent: :destroy
    
end
