require './query'
require './results'
require 'mail'
require 'pony'

class MailWrapper
  # need to return false if exception

  def initialize(username, password, address, port, enable_ssl)

    Mail.defaults do
           retriever_method :pop3,
            :user_name  => username,
            :password   => password,
            :address    => address,
            :port       => port,
            :enable_ssl => enable_ssl
    end
  end
  
  def fetch_all
    Mail.all
  end
  
  def send_mail(user, body)
    
    Pony.mail(  :to => 'shailpatel2@gmail.com, adennis4@gmail.com',
              :subject => 'Bot Results',
              :body => body,
              :via => :smtp,
              :via_options => {
                  :address              => 'smtp.gmail.com',
                  :port                 => '587',
                  :enable_starttls_auto => true,
                  :user_name            => user.user_name,
                  :password             => user.password,
                  :authentication       => :plain, 
                  :domain               => "HELO" 
              }
            )
   
  end
end
