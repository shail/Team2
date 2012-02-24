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
  
  def parse_emails
    emails = Mail.all
    puts "No new mail" if emails == []
    emails.map do |email| 
     unformated_results = Query.from_email(email).find_results
     Results.from_query(unformated_results).format_by_email
    end
  end
  
  def send_mail(user, body)
    puts user.user_name
    puts body
    
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
    puts "Mail sent!"
  end
end