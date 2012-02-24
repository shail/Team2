require 'yaml'
require './mail_wrapper'

class Users
  attr_reader :user_name, :mailbox, :password
  
  def initialize(config_yaml)
            config_file = YAML::load File.open(config_yaml)
             @user_name = config_file["user_name"]
             @password = config_file["password"]
              @mailbox = MailWrapper.new(config_file["user_name"], config_file["password"], config_file["address"], config_file['port'], config_file["enable_ssl"])
  end
  
  def process_mail
    email_responses = @mailbox.parse_emails
    email_responses.each { |response| @mailbox.send_mail(self, response) }
  end
end


#main loop code
Users.new("config.yml").process_mail
emails.map do |email| 
 unformated_results = Query.from_email(email).find_results
 Results.from_query(unformated_results).format_by_email
end