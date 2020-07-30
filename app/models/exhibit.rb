class Exhibit < ApplicationRecord
    belongs_to :museum
    has_many :items

    accepts_nested_attributes_for :items, allow_destroy: true

    def self.find_name
        Exhibit.all.map do |exhibit|
            exhibit.name
        end    
    end
end
