class Loan < ApplicationRecord
    belongs_to :item
    belongs_to :exhibit
end
