class Museum < ApplicationRecord
    has_many :exhibits
    has_many :items, through: :exhibits
end
