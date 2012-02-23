require 'yaml'
require 'mail'
require './mail_wrapper'

class EmailInbox
  
  def initialize(config_file)
    @config_file = YAML::load File.open(config_file)
    
    if File.exist? config_file
             @user_name = @config_file["user_name"]
              @password = @config_file["password"]
               @address = @config_file["address"]
                  @port = @config_file['port']
            @enable_ssl = @config_file["enable_ssl"]        
      else
        raise "Bad config file."
    end

  end
  
   def fetch_all
     mail_connection = MailWrapper.new(@user_name, @password, @address, @port, @enable_ssl)
     return false unless mail_connection
     mail_connection.get_all
   end

end

email = EmailInbox.new('config.yml')
all_emails = email.fetch_all
puts all_emails
