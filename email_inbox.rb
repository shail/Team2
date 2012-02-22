require 'yaml'
class EmailInbox
  
  def initialize(config_file)
    @config_file = YAML::load File.open(config_file)
    
    if File.exist? config_file
             @user_name = @config_file["user_name"]
              @password = @config_file["password"]
               @address = @config_file["address"]
                  @port = @config_file['port']
            @enable_ssl = @config_file["enable_ssl"]
         
         

      set_email_retriever
      
    else
      raise "Bad Config"
    end

  end
  
  # def fetch_all
  #   my_mail = Mail.new
  #   @emails = my_mail.all
  # end
  
  private

           def set_email_retriever
             
             Mail.defaults do
               retriever_method :pop3,
                 :user_name  => @user_name,
                 :password   => @password,
                 :address    => @address,
                 :port       => @port,
                 :enable_ssl => @enable_ssl
               end
           end
  
end

inbox = EmailInbox.new('config.yml')
all_emails = inbox.fetch_all
puts all_emails
