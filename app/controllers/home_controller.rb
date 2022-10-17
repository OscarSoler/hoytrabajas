class HomeController < ApplicationController
	def index
		@banks = Bank.order(:created_at)
	end
end
