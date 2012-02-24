require './query.rb'
require 'twitter'
require 'barometer'
require 'mail'

describe Query do
  it "exists" do
    Query
  end
  
  describe ".from_email" do
    before(:each) do
      @email = double('email')
    end
    
    it "expects an email parameter and returns a query instance" do
      @email.stub!(:body).and_return('hi')
      @email.stub!(:subject).and_return("twitterbot")
      @email.stub!(:to).and_return("twitterbot@devbootcamp.com")
      my_query = Query.from_email(@email)
      my_query.should be_a_kind_of Query
    end
    
    it "stores the email's subject as search term" do
      @email.stub!(:body).and_return('hi')
      @email.stub!(:subject).and_return("twitterbot")
      @email.stub!(:to).and_return("twitterbot@devbootcamp.com")
      query = Query.from_email(@email)
      query.search_term.should eq "hi"
    end
    
    it "returns a twitter query if to address is twitterbot(@whatever)" do
      @email.stub!(:body).and_return('hi')
      @email.stub!(:subject).and_return("twitterbot")
      @email.stub!(:to).and_return("twitterbot@devbootcamp.com")
      my_query = Query.from_email(@email)
      my_query.should be_an_instance_of TwitterQuery
    end
    
    it "returns a weather query if to address is weatherbot(@whatever)" do
      @email.stub!(:body).and_return('94539')
      @email.stub!(:subject).and_return("weatherbot")
      @email.stub!(:to).and_return("weatherbot@devbootcamp.com")
      my_query = Query.from_email(@email)
      my_query.should be_an_instance_of WeatherQuery
    end
  end
end

describe TwitterQuery do
  it 'exists' do
    TwitterQuery
  end
  
  describe "#find_results" do
    it "searches for search term and returns an array of results" do
      search_term = 'search term'
      t_query = TwitterQuery.new(search_term)
      my_search = t_query.find_results
      my_search.should be_a_kind_of Array
    end
  end
  
end

describe WeatherQuery do
  it 'exists' do
    WeatherQuery
  end
  
  describe "#find_results" do
    it "searches for search term and returns an array of results" do
      search_term = "90210"
      w_query = WeatherQuery.new(search_term)
      my_search = w_query.find_results
      my_search.should be_a_kind_of Barometer::Measurement::ResultArray
    end
  end
end
