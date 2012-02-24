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

  def get_all
    Mail.all
  end
  
  def send_mail
    mail = Mail.new do
      from     Users.user_name
      to       'you@test.lindsaar.net'
      subject  'Here is the image you wanted'
      body     File.read('body.txt')
      add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
    end

    mail.deliver!
  end
 
end
