require './query.rb'

describe Query do
  it "exists" do
    Query
  end
  
  describe ".from_email" do
    before(:each) do
      @email = double('email')
      @email.stub!(:subject).and_return("britney spears")
      @email.stub!(:to).and_return("twitterbot@devbootcamp.com")
    end
    
    it "expects an email parameter and returns a query instance" do
      my_query = Query.from_email(@email)
      my_query.should be_a_kind_of Query
    end
    
    it "stores the email's subject as search term" do
      my_query = Query.from_email(@email)
      my_query.search_term.should eq "britney spears"
    end
    
    it "should return a twitter query if to address is twitterbot(@whatever)" do
      my_query = Query.from_email(@email)
      my_query.should be_an_instance_of TwitterQuery
    end
    
    it "should return a weather query if to address is weatherbot(@whatever)" do
      @email.stub!(:to).and_return("weatherbot@devbootcamp.com")
      my_query = Query.from_email(@email)
      my_query.should be_an_instance_of WeatherQuery
    end
  end
  
end