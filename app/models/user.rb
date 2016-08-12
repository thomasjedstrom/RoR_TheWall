class User < ActiveRecord::Base
	has_secure_password

	has_many :messages
	has_many :comments, dependent: :destroy
	has_many :comments, through: :messages

  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
	validates :password, length: { minimum: 6 }
end
