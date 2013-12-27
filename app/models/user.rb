class User < ActiveRecord::Base
before_save :encrypt_password
after_save :clear_password




def encrypt_password

salt = BCrypt::Engine.generate_salt
encrypted_password = BCrypt::Engine.hash_secret(password, salt)

end


def clear_password


end

validates :username,  presence: true, length: { :in => 1..15 }, uniqueness: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

validates :password,  presence: true, length: { :in => 6..20 }

attr_accessible :username, :email, :password
  
end
