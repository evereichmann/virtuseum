class Ahoy::Store < Ahoy::DatabaseStore

    Ahoy.visit_duration = 24.hours
    
    Ahoy.cookie_domain = :all

    
end

# set to true for JavaScript tracking
Ahoy.api = false
