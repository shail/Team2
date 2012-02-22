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
  
  # it "should read a subject for an email" do
  #    my_inbox = EmailInbox.new("config.yml")
  #    my_emails = my_inbox.fetch_all
  #    my_emails.subject.should eq "Example Message"
  # end
  
  
end