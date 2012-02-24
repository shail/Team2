class Results
  def self.from_query(unformatted_results)
    available_results = {
                        Twitter::Status => TwitterResults,
                        Barometer::Measurement::Result => WeatherResults
                        }
    
    results = available_results[unformatted_results[0].from_class]
    results.new(unformatted_results) 
   
    
  end
end


class TwitterResults < Results
  def initialize(unformatted_results)
    @unformatted_results = unformatted_results 
  end
  
  def format_by_email
    email_body = ''
    @unformatted_results.each do |twitter_result|
      email_body << "User: #{twitter_result.from_user} Text: #{twitter_result.text}\n\n"
    end
    email_body
  end
end

class WeatherResults < Results
  def initialize(unformatted_results)
    @unformatted_results = unformatted_results
  end
  
  def format_by_email
    email_body = ''
    @unformatted_results.each do |weather_result|
      email_body << "Date: #{weather_result.valid_start_date}, Weather: #{weather_result.icon}.  High: #{weather_result.high}, Low: #{weather_result.low}"
    end
    email_body
  end
end


















#Results.new(unformatted_query_return)














