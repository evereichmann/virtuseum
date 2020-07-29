class Item < ApplicationRecord
    belongs_to :collection
    belongs_to :exhibit


    def date_ad_bc
        date = self.year_created
            if date > 0
                "#{date} AD"         
            elsif date < 0
                num = date.to_i 
                year = num *= -1 
                "#{year} BC"
            else
                0
            end    
        end   
end
