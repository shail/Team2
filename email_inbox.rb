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
        raise "Bad Config"
    end

  end
  
   def fetch_all
     my_mail_wrapper = MailWrapper.new(@user_name, @password, @address, @port, @enable_ssl)
     return false unless my_mail_wrapper
     my_mail_wrapper.get_all 
   end

end
