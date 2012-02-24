require 'twitter'
require 'barometer'

class Query

  attr_accessor :search_term
  attr_reader :response
  
  def initialize(search_term)
    @search_term = search_term
  end
  
  def self.from_email(email)
    available_queries = {
                        "twitterbot" => TwitterQuery,
                        "weatherbot" => WeatherQuery
                        }
    target_bot = email.subject.strip
    query = available_queries[target_bot]
    return nil unless query
    search_query = email.body.decoded
    query.new(search_query) 
  end
end


class TwitterQuery < Query
  def find_results
    twitter_results = Twitter.search(search_term, :ppr => 10)
  end
end


class WeatherQuery < Query
  def find_results
    barometer = Barometer.new(search_term)
    barometer.measure.forecast
  end
end


