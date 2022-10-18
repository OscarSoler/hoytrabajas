class HomeController < ApplicationController
	def index
		@banks = Bank.order("created_at DESC")
		@providers = Provider.order("created_at DESC")
	end

	def dashboard
		
	end
end
