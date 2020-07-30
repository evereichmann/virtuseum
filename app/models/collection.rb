class Collection < ApplicationRecord
    belongs_to :user
    has_many :items

    accepts_nested_attributes_for :items, allow_destroy: true

    def self.find_name
        Collection.all.map do |exhibit|
            exhibit.name
        end    
    end
end
