class Query

  attr_accessor :search_term
  
  def initialize(search_term)
    @search_term = search_term
  end
  
  def self.from_email(email)
    my_query = if email.to.index("twitterbot")
      TwitterQuery.new(email.subject)    
    elsif email.to.index("weatherbot")
      WeatherQuery.new(email.subject)    
    else
      self.new(email.subject)    
    end
  end
  
  
end


class TwitterQuery < Query
end

class WeatherQuery < Query
end






















#  Query Object
##  Instantiated from Email -- passed an "bot" to direct to ; passed search terms - factory method from_email
##  Twitter / Weather Query
##  Instantiates Results object-- passing a string to Results