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
		#For now just get the first one
		@campaign = Campaign.find :first
		@pusherkey = Pusher.key

		@nyt = [
    {
      "byline" => "By LIZ ROBBINS",
      "date" => "20121111",
      "title" => "In Hurricane Sandy\u2019s Wake, the Peddlers Move In",
      "url" => "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/in-hurricane-sandys-wake-the-peddlers-move-in.html"
    },
    {
      "byline" => "By ANDREW MARTIN",
      "date" =>"20121111",
      "title" => "Hurricane Sandy and the Disaster-Preparedness Economy",
      "url" => "http:\/\/www.nytimes.com\/2012\/11\/11\/business\/hurricane-sandy-and-the-disaster-preparedness-economy.html"
    },
    {
      "byline" =>"By GRETCHEN MORGENSON",
      "date" => "20121111",
      "title"=>"FAIR GAME; Muni Bond Issuers, Too, Need Help After Sandy",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/business\/muni-bond-issuers-too-need-help-after-sandy.html"
    },
    {
      "byline"=> "By CASS R. SUNSTEIN",
      "date"=> "20121111",
      "title"=> "OPINION; Climate Change: Lessons From Ronald Reagan",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/sunday\/climate-change-lessons-from-ronald-reagan.html"
    },
    {
      "byline"=> "By COREY KILGANNON",
      "date"=> "20121111",
      "title"=> "CHARACTER STUDY; For Every Character, a Different Storm Story",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/for-every-character-a-different-storm-story.html"
    },
    {
      "byline"=> "By JOSHUA BRUSTEIN",
      "date"=> "20121111",
      "title"=> "APP CITY; New Tools for Disaster Aid",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/app-city-new-tools-for-disaster-aid.html"
    },
    {
      "byline"=> "By ALAN FEUER",
      "date"=> "20121111",
      "title"=> "Where FEMA Fell Short, Occupy Sandy Was There",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/where-fema-fell-short-occupy-sandy-was-there.html"
    },
    {
      "byline"=> "By SUSAN STELLIN",
      "date"=> "20121111",
      "title"=> "GETTING STARTED; Reconsidering Flood Insurance After Hurricane Sandy",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/realestate\/reconsidering-flood-insurance-after-hurrican-sandy.html"
    },
    {
      "date"=> "20121111",
      "title"=> "LETTER; The Government and the Storm",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/the-government-and-the-storm.html"
    },
    {
      "byline"=> "By GINGER STRAND",
      "date"=> "20121111",
      "title"=> "OPINION; Hitchhiking\u2019s Time Has Come Again",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/sunday\/hitchhikings-time-has-come-again.html"
    }
  ]
	end
end