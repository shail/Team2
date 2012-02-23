class Results
  def self.from_query(unformatted_results)
    if unformatted_results[0].from_class == Twitter::Status
      TwitterResults.new
    else
      WeatherResults.new
    end
    
  end
  
  
  
end


class TwitterResults < Results
  
end

class WeatherResults < Results
  
end


















#Results.new(unformatted_query_return)














