class Item < ApplicationRecord
    belongs_to :collection
    belongs_to :exhibit
end
