require 'rails_helper'
# require 'spec_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error.." do
    message = Message.new(:body => "hi", :to => '1111111111', :from => '5038500933')
    message.save.should be_falsey
  end
  it "adds an error if the number is invalid" do
    message = Message.new(:body => "hi", :to => '1111111111', :from => '5038500933')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111111 is not a valid phone number."]
  end
end
