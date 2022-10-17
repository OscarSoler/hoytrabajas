require "application_system_test_case"

class BanksTest < ApplicationSystemTestCase
	setup do
		@user = users(:one)
		sign_in(@user)
	end

	test "visiting the index" do
	  visit root_path
	  assert_selector "h1", text: "Bancos"
	end
	
end
