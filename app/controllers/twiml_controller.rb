class TwimlController < ApplicationController
	protect_from_forgery :except => :voice
	skip_before_filter :verify_authenticity_token

	def voice
		render 'voice.xml.erb', :content_type => 'text/xml'
	end

	def sms
		@client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		message_body = params["Body"]
    	from_number = params["From"]
    	to_number = params["To"]
    	@campaign = Campaign.find_by_phone_num(to_number)
    	sms_message = SmsMessage.new
    	sms_message.from_num = from_number
    	sms_message.to_num  = to_number
    	sms_message.body = message_body
    	sms_message.campaign_id = @campaign.id
    	sms_message.save
    	@client.account.sms.messages.create(
      :from => to_number,
      :to => from_number,
      :body => "Someone will get back to you as soon as possible."
    	)
    Pusher['dashboard-events'].trigger('new-sms', {:message => sms_message.as_json} )
    render 'sms.xml.erb', :content_type => 'text/xml'
	end

	def send_sms
		to = params[:to]
		body = params[:message]
		campaign = Campaign.find :first
		@client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
		@client.account.sms.messages.create(
      :from => campaign.phone_num,
      :to => to,
      :body => body
    	)

    sms_message = SmsMessage.new
    sms_message.from_num = to
    sms_message.to_num  = campaign.phone_num
    sms_message.body = body
    sms_message.campaign_id = campaign.id
    sms_message.user_id = current_user.id
    sms_message.save
		redirect_to :controller => "home", :action => "dashboard"
	end

	def modal_sms
		@sms =  SmsMessage.find params[:id]
		@all_user_messages = SmsMessage.where(:from_num => @sms.from_num).all
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
		render 'enqueue_caller.xml.erb', :content_type => 'text/xml'
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
		@campaign = Campaign.find_by_phone_num(params[:To])
		voice_message = VoiceMessage.new
		voice_message.voice_message_url = params['RecordingUrl'] 
		voice_message.recording_time = params['RecordingDuration']
		voice_message.recording_sid = params['RecordingSid']
		voice_message.from_num = params['Caller']
		voice_message.campaign_id = @campaign.id
		voice_message.save
		Pusher['dashboard-events'].trigger('new-voicemail', {:message => voice_message.as_json} )
		render 'save_recording.xml.erb', :content_type => 'text/xml'
	end
end
