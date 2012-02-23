class Query
  # play code

  def initialize (service, requester, search_parameters)
    @service = service
    @requester = requester
    @search_parameters = search_parameters
  end
  
  def self.from_email (email_from_inbox)
    to = emaiL_from_inbox.to
    from = emaiL_from_inbox.from
    subject = emaiL_from_inbox.subject
    new_query = Query.new (to, from, subject)
  end
  
  def self.from_sms (sms_message)
    to = sms_message.to
    from = sms_message.from
    body = sms_message.body
    new_query = Query.new (to, from, body)
  end
  
  def fetch_results
    if @service == 'Twitter'
      query_raw_information = Query::Twitter.new(@serach_parameters)
      Results.new(query_raw_information)
    else
      
    
  end
  
end

Results.new('')

results = my_query.get_results
results.deliver_by_email
results.deliver_by_sms

class Results
  def initialize (query_raw_info)
    #format query_raw_info
   
  end
  
  def deliver_by_email(source)
    Mail.deliver
  end
  
end