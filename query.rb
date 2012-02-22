require 'twitter'
require 'barometer'

class Query

  attr_accessor :search_term
  attr_reader :response
  
  def initialize(search_term)
    @search_term = search_term
  end
  
  def execute()
    # Uses internal @search_term to run a query    
    # Default behavior: no results
    # Implement in subclasses
    
    @response = ""
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
  def execute
    @twitter_results = Twitter.search(search_term)
  end
end

class WeatherQuery < Query
  def execute
    barometer = Barometer.new(search_term)
    @weather_results = barometer.measure 
  end
end