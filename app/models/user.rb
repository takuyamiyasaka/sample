class User < ApplicationRecord
	before_save { email.downcase! }
	validates(:name, presence:true, length: {maximum: 50})  #オプションシンボル 上と下の記述は同じ意味
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence:true,length: {maximum: 255},
					  format: {with: VALID_EMAIL_REGEX },
					  uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password,presence:true, length: {minimum: 6}
end
