class User < ApplicationRecord
    has_many :collections
    has_many :items, through: :collections

    has_many :visits, class_name: "Ahoy::Visit"

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true

end
