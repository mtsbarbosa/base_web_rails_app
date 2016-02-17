require 'rails_helper'

RSpec.feature "Destroying users" do
	let!(:user) {FactoryGirl.build(:user)}

	scenario "Destroying a user with success" do
		sign_up_in_as!(user)
		click_link I18n.t("user._entity_index")
		click_link user.email
		click_link I18n.t("user._entity_destroy")

		expect(page).to have_content(I18n.t("user._entity_destroyed_success"))
	end
end