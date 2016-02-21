require 'rails_helper'

RSpec.feature "Show users" do
	let!(:user_admin) {FactoryGirl.create(:user_admin)}
	let!(:user_moderator) {FactoryGirl.create(:user_moderator)}

	scenario 'Successful user showed' do
		sign_in_as!(user_admin)
		visit '/'
		click_link I18n.t("user._entity_index")
		click_link user_admin.email

		expect(page).to have_content(I18n.t("user._entity"))
		expect(page).to have_content(user_admin.email)

		click_link I18n.t("session._sign_out")

		sign_in_as!(user_moderator)
		visit '/'
		click_link I18n.t("user._entity_index")
		click_link user_moderator.email

		expect(page).to have_content(I18n.t("user._entity"))
		expect(page).to have_content(user_moderator.email)
	end
end