class User < ApplicationRecord
    has_many :collections
    has_many :items, through: :collections

    has_secure_password

    # def password=(secret)
    #    hashed_pass = BCrypt::Password.create(secret) 
        
    #    self.password_digest = hashed_pass
    # end

    # def password
    #     self.password_digest
    # end

end
