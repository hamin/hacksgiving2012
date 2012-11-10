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

		@nyt_articles = [
    {
      "body" => "ON the Saturday before Hurricane Sandy struck, when forecasters were still branding the offshore menace “Frankenstorm,” Dennis and Brian Concha hung a novelty T-shirt in the window of Think D’Sign Print, their year-old shop in Cranford, N.J. The shirt showed the familiar monster inside a hurricane symbol with “Frankenstorm",
      "byline" => "By LIZ ROBBINS",
      "date" => "20121111",
      "title" => "In Hurricane Sandy\u2019s Wake, the Peddlers Move In",
      "url" => "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/in-hurricane-sandys-wake-the-peddlers-move-in.html"
    },
    {
      "body" => "WAUKESHA, Wis. FOLKS here don’t wish disaster on their fellow Americans. They didn’t pray for Hurricane Sandy to come grinding up the East Coast, tearing lives apart and plunging millions into darkness. But the fact is, disasters are good business in Waukesha. And, lately, there have been a lot of disasters. This Milwaukee suburb, once",
      "byline" => "By ANDREW MARTIN",
      "date" =>"20121111",
      "title" => "Hurricane Sandy and the Disaster-Preparedness Economy",
      "url" => "http:\/\/www.nytimes.com\/2012\/11\/11\/business\/hurricane-sandy-and-the-disaster-preparedness-economy.html"
    },
    {
      "body" => "IT’S going to take a long time to get over Sandy. For homeowners, towns, hospitals, school districts — on and on — the recovery is painfully slow. Everyone wants the rebuilding effort to go faster. But that takes money — something that many communities have precious little of. Sandy is likely to weigh on local governments",
      "byline" =>"By GRETCHEN MORGENSON",
      "date" => "20121111",
      "title"=>"FAIR GAME; Muni Bond Issuers, Too, Need Help After Sandy",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/business\/muni-bond-issuers-too-need-help-after-sandy.html"
    },
    {
      "body"=> "THE re-election of President Obama, preceded by the extraordinary damage done by Hurricane Sandy, raises a critical question: In the coming years, might it be possible for the United States to take significant steps to reduce the risks associated with climate change? A crucial decision during Ronald Reagan’s second term suggests that the",
      "byline"=> "By CASS R. SUNSTEIN",
      "date"=> "20121111",
      "title"=> "OPINION; Climate Change: Lessons From Ronald Reagan",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/sunday\/climate-change-lessons-from-ronald-reagan.html"
    },
    {
      "body"=> "ED SHEVLIN looked out over a mountain range of soggy trash in the parking lot of Jacob Riis Park in Queens and proclaimed it “an tubaiste mor” — a big disaster. The words were in Irish, the language that survives in parts of Ireland. Few people in New York City are as immersed in the language as Mr. Shevlin, 52, a New York City",
      "byline"=> "By COREY KILGANNON",
      "date"=> "20121111",
      "title"=> "CHARACTER STUDY; For Every Character, a Different Storm Story",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/for-every-character-a-different-storm-story.html"
    },
    {
      "body"=> "As Hurricane Sandy headed for the city two weeks ago, sirens began ringing on some New Yorkers’ cellphones. The alarms were accompanied by messages telling them to stay inside; not to drive; or for those in Zone A, to evacuate. Government officials have been working with wireless carriers to build the alert system , which contacts anyone",
      "byline"=> "By JOSHUA BRUSTEIN",
      "date"=> "20121111",
      "title"=> "APP CITY; New Tools for Disaster Aid",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/app-city-new-tools-for-disaster-aid.html"
    },
    {
      "body"=> "ON Wednesday night, as a fierce northeaster bore down on the weather-beaten Rockaways, the relief groups with a noticeable presence on the battered Queens peninsula were these: the National Guard, the Federal Emergency Management Agency, the Police and Sanitation Departments — and Occupy Sandy, a do-it-yourself outfit recently established by",
      "byline"=> "By ALAN FEUER",
      "date"=> "20121111",
      "title"=> "Where FEMA Fell Short, Occupy Sandy Was There",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/nyregion\/where-fema-fell-short-occupy-sandy-was-there.html"
    },
    {
      "body"=> "IN the aftermath of Hurricane Sandy , homeowners and renters who have insurance are discovering what it covers — and what it doesn’t — while those with minimal or no insurance may be recalculating their risks. As images of waterlogged houses continue to dominate the news, the biggest surprise may be that most homeowners’ and",
      "byline"=> "By SUSAN STELLIN",
      "date"=> "20121111",
      "title"=> "GETTING STARTED; Reconsidering Flood Insurance After Hurricane Sandy",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/realestate\/reconsidering-flood-insurance-after-hurrican-sandy.html"
    },
    {
      "body"=> "To the Editor: Re “ Fractured Recovery Divides a Frustrated Region ” (front page, Nov. 4): We live in an era when government is viewed by many Americans as the problem, not the solution. But catastrophes like Hurricane Sandy remind us why we need government, both to protect us from devastation and to quickly restore civilized society",
      "date"=> "20121111",
      "title"=> "LETTER; The Government and the Storm",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/the-government-and-the-storm.html"
    },
    {
      "body"=> "ONE of the more dramatic measures to keep New Yorkers moving after Hurricane Sandy’s transit meltdown was mandatory car-pooling on bridges into Manhattan. Commuters griped about gridlock at checkpoints, and drivers were shocked by Mayor Michael R. Bloomberg’s suggestion that they pick up strangers . Potential passengers, too, were",
      "byline"=> "By GINGER STRAND",
      "date"=> "20121111",
      "title"=> "OPINION; Hitchhiking\u2019s Time Has Come Again",
      "url"=> "http:\/\/www.nytimes.com\/2012\/11\/11\/opinion\/sunday\/hitchhikings-time-has-come-again.html"
    }
  ]
	end
end