require 'yaml'


class Users
  attr_reader :user_name, :mailbox, :password
  
  def initialize(config_yaml)
            config_file = YAML::load File.open(config_yaml)
             @user_name = config_file["user_name"]
             @password = config_file["password"]
             @mailbox = MailWrapper.new(config_file["user_name"], config_file["password"], config_file["address"], config_file['port'], config_file["enable_ssl"])
  end
  
  def process_mail
    @mailbox.fetch_all
  end
end



#main loop code
