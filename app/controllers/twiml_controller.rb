class TwimlController < ApplicationController
	protect_from_forgery, :except => :voice
	skip_before_filter :verify_authenticity_token

	def voice
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		render 'voice.xml.erb', :content_type => 'text/xml'
	end

	def sms
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
	end
end
