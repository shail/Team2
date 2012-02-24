require './mail_wrapper'

describe MailWrapper do
  it "exists" do
    MailWrapper
  end
  
  before :all do
        @email_inbox = MailWrapper.new('dbcteam2@gmail.com', 'emailbot', 'pop.gmail.com', '995', true)
      end
  it "gets initalized with user parameters" do

    @email_inbox.should be_an_instance_of MailWrapper
  end
  
  describe "#send_mail" do
    it "returns a Mail::Message object" do
      user = double('user')
      user.stub!(:user_name).and_return('dbcteam2@gmail.com')
      user.stub!(:password).and_return('emailbot')
      email = @email_inbox.send_mail(user, 'hey')
      email.should be_an_instance_of Mail::Message
    end
  end
  
  
  
  
end

