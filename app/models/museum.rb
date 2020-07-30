class Museum < ApplicationRecord
    has_many :exhibits
    has_many :items, through: :exhibits
    has_many :curators
    has_many :users, through: :curators

    def self.museum_field_of_study
        self.all.map{|area| area.field_of_study}    
    end    
  
    def self.do_they_match
        self.all.select{|name| name.field_of_study == @field }
    end  
        
end
