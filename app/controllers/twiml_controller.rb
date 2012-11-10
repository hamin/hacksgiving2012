class TwimlController < ApplicationController
	protect_from_forgery :except => :voice
	skip_before_filter :verify_authenticity_token

	def voice
		render 'voice.xml.erb', :content_type => 'text/xml'
	end

	def sms
		@client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
	end

	def volunteer_voice
		render 'volunteer_voice.xml.erb', :content_type => 'text/xml'
	end

	def about_to_connect
		render 'about_to_connect.xml.erb', :content_type => 'text/xml'
	end

	def ivr
		selection = params['Digits']

		case selection
		when '1'
			redirect_to :action => 'enqueue_caller'
		when '2'
			redirect_to :action => 'voicemail'
		when '3'
			redirect_to :action => 'subscribe'
		else
			redirect_to :action => 'goodbye' 		
		end
	end


	def volunteer
		@client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		@account = @client.accounts.get(TWILIO_SID)


		if @client_participant.present?
			redirect_to :action => 'client_call'
		elsif @user = User.available_user
			redirect_to :action => 'phone_call'
		else
			redirect_to :action => 'voicemail'	
		end

	end

	def enqueue_caller
		render 'enqueue_user.xml.erb', :content_type => 'text/xml'
	end

	def wait_url
		render 'wait_url.xml.erb', :content_type => 'text/xml'
	end

	def client_call
		render 'client_call.xml.erb', :content_type => 'text/xml'
	end

	def phone_call
		render 'phone_call.xml.erb', :content_type => 'text/xml'
	end

	def voicemail
		@caller_number = params[:From]
		render 'voicemail.xml.erb', :content_type => 'text/xml'
	end

	def subscribe
		render 'subscribe.xml.erb', :content_type => 'text/xml'
	end

	def goodbye
		render 'goodbye.xml.erb', :content_type => 'text/xml'
	end

	def save_recording
		voice_message = VoiceMessage.new
		voice_message.voice_message_url = params['RecordingUrl'] 
		voice_message.recording_time = params['RecordingDuration']
		voice_message.recording_sid = params['RecordingSid']
		voice_message.from_num = params['Caller']
		voice_message.save
		render 'save_recording.xml.erb', :content_type => 'text/xml'
	end
end
