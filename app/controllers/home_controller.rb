class HomeController < ApplicationController
	def index
		if current_user
			redirect_to :action => 'dashboard'
		end
	end

	def dashboard
		@client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		
		@capability = Twilio::Util::Capability.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		@capability.allow_client_outgoing(TWILIO_APP_SID)
		@token = @capability.generate

		@campaign = Campaign.find :first
		
	end
end