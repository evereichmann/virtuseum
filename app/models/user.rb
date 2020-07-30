class User < ApplicationRecord
    has_many :collections
    has_many :items, through: :collections

    has_many :visits, class_name: "Ahoy::Visit"

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true

    # def password=(secret)
    #    hashed_pass = BCrypt::Password.create(secret) 
        
    #    self.password_digest = hashed_pass
    # end

    # def password
    #     self.password_digest
    # end

end
