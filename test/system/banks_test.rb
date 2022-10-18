require "application_system_test_case"

class BanksTest < ApplicationSystemTestCase
	setup do
		@bank = banks(:one)
		
		@user = users(:one)
		sign_in(@user)
	end

	test "visiting the index" do
		visit root_path
		assert_selector "h1", text: "Bancos"
	end

	test "should create bank" do
		visit root_path
		click_on "Añadir Banco"

		fill_in "Nombre", with: @bank.name
		click_on "Crear Banco"

		assert_text "Bank was successfully created."
	end

	test "should update Bank" do
		visit root_path
		
		first('.bxs-edit').click
		
		fill_in "Nombre", with: @bank.name
		click_on "Actualizar Banco"

		assert_text "Bank was successfully updated"
		
	end

	test "should destroy Bank" do
		visit root_path
		first('.bxs-trash').click
		accept_confirm
		assert_text "Bank was successfully destroyed"
	end
end
