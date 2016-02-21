require 'rails_helper'

RSpec.feature "Destroying users" do
	let!(:user_admin) {FactoryGirl.create(:user_admin)}
	let!(:user_moderator) {FactoryGirl.create(:user_moderator)}

	scenario "Destroying a user with success for admin" do
		destroy_user_test(user_admin)
	end

	scenario "Destroying a user with success for moderator" do
		destroy_user_test(user_moderator)
	end

	private
		def destroy_user_test(user_test)
			sign_in_as!(user_test)
			click_link I18n.t("user._entity_index")
			click_link user_test.email
			click_link I18n.t("user._entity_destroy")

			expect(page).to have_content(I18n.t("user._entity_destroyed_success"))
		end
end