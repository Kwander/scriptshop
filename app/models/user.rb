class User < ActiveRecord::Base


validates :username,  presence: true, length: { maximum: 10 }, uniqueness: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

validates :password,  presence: true, length: { maximum: 50 }
  
end
