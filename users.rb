require 'yaml'

class Users
  
  attr_reader :user_name
  
  def initialize (config_file)
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
end