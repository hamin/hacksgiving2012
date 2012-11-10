class TwimlController < ApplicationController


	def voice
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)

		# build up a response
		response = Twilio::TwiML::Response.new do |r|
		  r.Say 'hello there', :voice => 'woman'
		end

		respond_to do |format|
      format.xml { render :xml => response.text }
    end
	end

	def sms
		# @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
	end
end
