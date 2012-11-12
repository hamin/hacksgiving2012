# Disaster Remote Response


## Winner of Hack 'N Jill Hacksgiving Hackathon 2012 in NYC ##

![HackNJill logo](http://hacknjill.com/images/hacknjill-logo.png)

Disaster Remote Response a remote disaster response platform where remote volunteers could provide helpful information to people pre/during/post a disaster via a live volunteer backed phone and text message support line in realtime.

### Pre-requisites ###
  * [TWILIO API Keys With Twilio Phone number](https://www.twilio.com/try-twilio) Sign up, its SUPER easy!
  * [PUSHER APP API Keys](http://pusher.com/) Sign up, its SUPER easy TOO! 
  * [Ruby](http://www.ruby-lang.org/) 1.9. Use [RVM](http://rvm.beginrescueend.com/) to manage your Ruby installations. It's good.
  * [Rubygems](http://rubygems.org/)
  * [Git](http://git-scm.com/)
  * The [Bundler](http://rubygems.org/gems/bundler) gem. Install with 'gem install bundler'.

## Installation and usage ##

Use Bundler to install project dependencies for you:

    $ bundle install

This will install gems and various other dependencies if not already on your system. It will also create a Gemfile.lock file which will ensure that dependencies do not change unless you explicitly rerun `bundle install` again.

### Configure ###

Make sure the following environemnt variables are set in your bash/zsh environemnt somehwere like so:

    $ export TWILIO_SID="youraccountsid"
    $ export TWILIO_AUTH_TOKEN="yourauthtoken"
    $ export TWILIO_APP_SID="yourtwilioappsid"

    $ export PUSHER_APP_ID="yourpusherappid"
    $ export PUSHER_KEY="yourpusherkey"
    $ export PUSHER_SECRET="yourpushersecret"

### Create local database and run migrations ###

Edit config/database.yml. You can then create the database and respective tables like so:

    $ bundle exec rake db:create && rake db:migrate

### Run locally ###

To run the application:

    $ bundle exec rails s
    
The app will be viewable at `http://localhost:3000`

## Screenshots ##

![Screenshot 1](https://github.com/hamin/hacksgiving2012/raw/master/screenshot1.png)

![Screenshot 2](https://github.com/hamin/hacksgiving2012/raw/master/screenshot2.png)


## Created By ##

Haris Amin - [Github: hamin](http://github.com/hamin), [Twitter: harisamin](http://twitter.com/harisamin)

Raquel Hernandez - [Github: maggit](http://github.com/maggit), [Twitter: maggit](http://twitter.com/maggit)

## Powered By ##
![Twilio logo](http://www.twilio.com/packages/company/img/logos_downloadable_round.png)

![Pusher logo](http://a0.twimg.com/profile_images/1710684122/pusher_logo.png)

### License ###

(The MIT License)

Copyright (c) 2012 Haris Amin, Raquel Hernandez

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the 'Software'), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.