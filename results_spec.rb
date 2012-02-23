require './results.rb'
require 'twitter'

describe Results do
  it "exists" do
    Results
  end
  
  describe ".from_query" do
    before(:each) do
      @unformatted_results = double('unformatted_results')
      @single_result = double("single_result")
      @single_result.stub!(:from_class).and_return(Twitter::Status)
      @unformatted_results.stub!(:[]).and_return(@single_result)
      #@unformatted_results[0].stub!(:from_class).and_return(Twitter::Status)
    end
    # it "expects an unformatted array paramter and returns a results instance" do
    #   my_results = Results.from_query(@unformatted_results)
    #   my_results.should be_a_kind_of Results
    # end
    
    it "returns a TwitterResults instance if the unformatted results array is a TwitterQuery" do
      my_results = Results.from_query(@unformatted_results)
      my_results.should be_a_kind_of TwitterResults
    end
      




    # it "formats Twitter results if" do
    #   unformatted_query_result = double('unformatted_query_result')
    #   unformatted_query_result.stub!(:find_class).and_return("")
    #   
    
    
  end
  
end
