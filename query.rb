require 'twitter'
require 'barometer'

class Query

  attr_accessor :search_term
  attr_reader :response
  
  def initialize(search_term)
    @search_term = search_term
    puts @search_term
  end
  
  def self.from_email(email)
    available_queries = {
                        "twitterbot" => TwitterQuery,
                        "weatherbot" => WeatherQuery
                        }
    target_bot = email.subject
    query = available_queries[target_bot]
    query.new(email.body.decoded)
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
    weather_results = barometer.measure.forecast
  end
end






# Weather Return Query Class == Barometer::Measurement::Result -- g[0].class
# Twitter Return Query Class == Twitter::Status -- results[0].class
# 
# 
# 
# 
# my_query = Query.from_email(email)
# results = my_query.find_results
# 
# results.class == 'TwitterQuery'
# 
# 
# 
# format_results = Results.new(results)
# format_results.deliver_by_email