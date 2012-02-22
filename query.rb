require 'twitter'
require 'barometer'

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
  def self.search(search_term)
    my_search = Twitter.search(search_term)
  end
end

class WeatherQuery < Query
  def self.search(search_term)
    barometer = Barometer.new(search_term)
    my_search = barometer.measure
  end
end






















#  Query Object
##  Instantiated from Email -- passed an "bot" to direct to ; passed search terms - factory method from_email
##  Twitter / Weather Query
##  Instantiates Results object-- passing a string to Results