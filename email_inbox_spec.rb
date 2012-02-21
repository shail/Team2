require './email_inbox'

describe EmailInbox do
  it "gets initialized with a config file" do
    my_inbox = EmailInbox.new("config.yml")
    my_inbox.should be_an_instance_of EmailInbox
  end
  
end