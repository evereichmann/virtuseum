class Museum < ApplicationRecord
    has_many :exhibits
    has_many :items, through: :exhibits
    has_many :curators
    has_many :users, through: :curators
end
