require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
	setup do
		@provider = providers(:one)
		@user = users(:one)
		sign_in(@user)
	end

	test "visiting the index" do
		visit root_path
		assert_selector "h1", text: "Proveedores"
	end

	test "should create provider" do
		visit root_path
		click_on "Añadir Proveedor"

		fill_in "Número de cuenta", with: @provider.account_number
		fill_in "Nombre", with: @provider.name
		fill_in "Nombre de Contacto", with: @provider.name_contact
		fill_in "Nit", with: @provider.nit
		fill_in "Teléfono de Contacto", with: @provider.phone_contact
		click_on "Crear Proveedor"

		assert_text "Provider was successfully created"
	end

	test "should update Provider" do
		visit root_path
		
		first('a[data-test=edit-provider]').click

		fill_in "Número de cuenta", with: @provider.account_number
		fill_in "Nombre", with: @provider.name
		fill_in "Nombre de Contacto", with: @provider.name_contact
		fill_in "Nit", with: @provider.nit
		fill_in "Teléfono de Contacto", with: @provider.phone_contact

		click_on "Actualizar Proveedor"

		assert_text "Provider was successfully updated"
	end

	test "should destroy Provider" do
		visit root_path
		first('a[data-test=delete-provider]').click
		accept_confirm
		assert_text "Provider was successfully destroyed."
	end
end
