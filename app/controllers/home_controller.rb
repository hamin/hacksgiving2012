class HomeController < ApplicationController
	def index
		if current_user
			redirect_to :action => 'dashboard'
		end
	end

	def dashboard
	end
end