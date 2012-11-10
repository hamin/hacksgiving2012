class TwimlController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def voice
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
	end

	def sms
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
	end
end
