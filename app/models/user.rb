class User < ApplicationRecord
  # relazioni
  has_many :hours
  has_many :clients

  attr_accessor :password_confirmation

  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # don't allow double dot emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  has_secure_password
  validates :password, presence: true, length: { minimum: 2 }
  validates_confirmation_of :password
  validates_presence_of :password_digest, :tarif

end
