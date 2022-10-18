# frozen_string_literal: true

class CountDashboardComponent < ViewComponent::Base
	def initialize(entity:, title:)
		@entity = entity
		@title = title
	end
end
