require 'yaml'
require './mail_wrapper'
require './query'
require './results'

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


user = Users.new("config.yml")
all_email_messages = user.process_mail

if all_email_messages == []
  puts "No new email"
else
  all_email_messages.each do |email|
    unformated_results = Query.from_email(email).find_results
    formatted_body_email = Results.from_query(unformated_results).format_by_email
    user.mailbox.send_mail(user, formatted_body_email)
end
end