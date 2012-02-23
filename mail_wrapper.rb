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
 
end
