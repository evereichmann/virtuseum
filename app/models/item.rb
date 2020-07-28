class Item < ApplicationRecord
    belongs_to :exhibit
    belongs_to :collection
end
