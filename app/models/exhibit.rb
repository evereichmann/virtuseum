class Exhibit < ApplicationRecord
    belongs_to :museum
    has_many :items 
end
