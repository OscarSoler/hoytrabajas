class HomeController < ApplicationController
	def index
		@banks = Bank.order("created_at DESC")
	end
end
