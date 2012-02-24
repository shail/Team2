require './results.rb'
require 'twitter'
require 'barometer'

describe Results do
  it "exists" do
    Results
  end
  
  describe ".from_query" do
    before(:each) do
      @unformatted_results = double('unformatted_results')
      @single_result = double("single_result")
      @unformatted_results.stub!(:[]).and_return(@single_result)
      
    end
   
    it "returns a TwitterResults instance if the unformatted results array is a TwitterQuery" do
      @single_result.stub!(:from_class).and_return(Twitter::Status)
      my_results = Results.from_query(@unformatted_results)
      my_results.should be_a_kind_of TwitterResults
    end
    
    it "returns a WeatherResults instance if the unformatted results array is a WeatherQuery" do
      @single_result.stub!(:from_class).and_return(Barometer::Measurement::Result)
      my_results = Results.from_query(@unformatted_results)
      my_results.should be_a_kind_of WeatherResults
    end
    
    
  end
  
end

describe TwitterResults do
  it 'exists' do
    TwitterResults
  end
  
  describe "#format_by_email" do
    it "returns a String of twitter results" do
      results = Twitter.search('dougie')
      instantiated_results = TwitterResults.new(results)
      email_body = instantiated_results.format_by_email
      email_body.should be_a_kind_of String
    end
  end
end
    
describe WeatherResults do
  it 'exists' do
    WeatherResults
  end
  
  describe "#format_by_email" do
    it "returns a String of weather results" do
      results = Barometer.new('90210').measure.forecast
      instantiated_results = WeatherResults.new(results)
      email_body = instantiated_results.format_by_email
      email_body.should be_a_kind_of String
      puts email_body
    end
  end
end

