require 'rails_helper'

RSpec.feature "Signing in" do
	let!(:user) {FactoryGirl.create(:user)}

	before do
		visit '/'

		click_link I18n.t("session._sign_in")
		fill_in 'user_email', with: user.email
	end

	scenario 'Successful sign in' do
		fill_in 'user_password', with: user.password
		click_button 'Log in'

		expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
	end

	scenario 'Failed sign in' do
		fill_in 'user_password', with: "__" + user.password
		click_button 'Log in'

		expect(page).to have_content(I18n.t("session._invalid_singin_full_message"))

		fill_in 'user_password', with: ""
		click_button 'Log in'

		expect(page).to_not have_content(I18n.t("devise.sessions.signed_in"))

		fill_in 'user_email', with: "_" + user.email
		fill_in 'user_password', with: user.password
		click_button 'Log in'

		expect(page).to_not have_content(I18n.t("devise.sessions.signed_in"))
	end
end