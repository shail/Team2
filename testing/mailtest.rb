require 'mail'
@emails = []

def fetch_all
  Mail.defaults do
    retriever_method :pop3,
      :user_name  => 'dbcteam2@gmail.com',
      :password   => 'emailbot',
      :address    => 'pop.gmail.com',
      :port       => 9952,
      :enable_ssl => true
    end
  @emails = Mail.all
end

fetch_all
puts @emails
