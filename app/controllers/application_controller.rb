class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def multi_sms
    begin
      recipients = params[:contact_ids]
      multi_body = params[:body]

      recipients.each do |recipient|
        recipient_number = Contact.find(recipient).number
        response = RestClient::Request.new(
          :method => :post,
          :url => 'https://api.twilio.com/2010-04-01/Accounts/AC71d7cc2523857a9e5bc698d3d3717cd4/Messages.json',
          :user => ENV['TWILIO_ACCOUNT_SID'],
          :password => ENV['TWILIO_AUTH_TOKEN'],
          :payload  => { :Body => multi_body,
                        :From => 5038500933,
                        :To   => recipient_number }
        ).execute
      end
    rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
    end
    redirect_to user_path(current_user)
  end
end
