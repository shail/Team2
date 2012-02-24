require './email_inbox'


describe EmailInbox do
  it "gets initialized with a config file" do
    my_inbox = EmailInbox.new("config.yml")
    my_inbox.should be_an_instance_of EmailInbox
  end
  
  it "should complain if config file doesn't exist" do
    lambda {EmailInbox.new("no_config_file.yml")}.should raise_error
  end
  
  it "should read the config file" do
    config_file = YAML::load(File.open('config.yml'))
    config_file['username'].should_not be ''
    config_file['password'].should_not be ''
  end
  
  
  describe "#fetch_all" do 
    it "should handle an empty inbox" do
      my_instance = double('my_mail_wrapper')
      my_instance.stub!(:get_all).and_return([])
      MailWrapper = double('MailWrapper')
      MailWrapper.stub!(:new).and_return(my_instance)
      
      my_inbox = EmailInbox.new("config.yml")
      my_inbox.fetch_all.should eq []
    end
    
    it "should handle a bad connection" do
      MailWrapper = double('MailWrapper') 
      MailWrapper.stub!(:new).and_return(false)
      my_inbox = EmailInbox.new("config.yml")
      my_inbox.fetch_all.should eq false
    end

    it "should handle a inbox with a single email" do
      mail1 = double ('mail1')
      my_instance = double('my_mail_wrapper')
      my_instance.stub!(:get_all).and_return([mail1])
      MailWrapper = double('MailWrapper')
      MailWrapper.stub!(:new).and_return(my_instance)
      my_inbox = EmailInbox.new("config.yml")
      my_inbox.fetch_all.should eq [mail1]
     end
   
  end

end