RestClient.post 'http://example.com/resource', :param1 => 'one', :nested => { :param2 => 'two' }

RestClient.post('https://AC71d7cc2523857a9e5bc698d3d3717cd4:a752eb069d3bf49923c4e6ee9f67d415@api.twilio.com/2010-04-01/Accounts/AC71d7cc2523857a9e5bc698d3d3717cd4/Messages.json',

                :Body => "hello world",
                :From => "5038500933",
                :To   => "9717128576")

response = RestClient::Request.new(
  :method => :post,
  :url => 'https://api.twilio.com/2010-04-01/Accounts/AC71d7cc2523857a9e5bc698d3d3717cd4/Messages.json',
  :user => 'AC71d7cc2523857a9e5bc698d3d3717cd4',
  :password => 'a752eb069d3bf49923c4e6ee9f67d415',
  :payload  => { :Body => "Do you work?",
                :From => "5038500933",
                :To   => "9717128576" }
).execute

#####

class Message
  def initialize(attributes)
    @to = attributes['to']
    @from = attributes['from']
    @body = attributes['body']
    @status = attributes['status']
  end
end

response = RestClient::Request.new(
  :method => :get,
  :url => 'https://api.twilio.com/2010-04-01/Accounts/AC71d7cc2523857a9e5bc698d3d3717cd4/Messages.json',
  :user => 'AC71d7cc2523857a9e5bc698d3d3717cd4',
  :password => 'a752eb069d3bf49923c4e6ee9f67d415'
).execute

16:46
