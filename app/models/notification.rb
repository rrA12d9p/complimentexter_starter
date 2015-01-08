require 'twilio-ruby'

class Notification
  attr_accessor :to_number, :from_number

  def initialize()
    self.to_number = ENV["twilio_to_number"]
    self.from_number = ENV["twilio_from_number"]
    account_sid = ENV["twilio_sid"]
    auth_token =  ENV["twilio_token"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    message = @client.account.messages.create(
    :body => random_compliment,
    :to => self.to_number,       
    :from => self.from_number)
  end

  def random_compliment
    compliments = ["A 3rd tier cable network would totally create a television show about you.", "Your handshake conveys intelligence, confidence and minor clamminess.", "Cops admire your ability to stay a perfect 3-5 miles above the speed limit.", "Your principal would call you to the office just to look cool."]
    return compliments.sample
  end
end