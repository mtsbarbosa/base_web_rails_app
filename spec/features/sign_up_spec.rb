require 'rails_helper'

RSpec.feature "Signing up" do
	let!(:user) {FactoryGirl.build(:user)}

	before do
		visit '/'

		click_link I18n.t("session._sign_up")
		fill_in 'user_email', with: user.email
	end

	scenario 'Successful sign up' do
		fill_in 'user_password', with: user.password
		fill_in 'user_password_confirmation', with: user.password_confirmation
		click_button 'Sign up'

		expect(page).to have_content(I18n.t("devise.registrations.signed_up"))
	end

	scenario 'Failed sign up' do
		click_button 'Sign up'

		expect(page).to_not have_content(I18n.t("devise.registrations.signed_up"))

		fill_in 'user_email', with: user.email
		fill_in 'user_password', with: user.password
		click_button 'Sign up'

		expect(page).to_not have_content(I18n.t("devise.registrations.signed_up"))

		fill_in 'user_email', with: user.email
		fill_in 'user_password_confirmation', with: user.password
		click_button 'Sign up'

		expect(page).to_not have_content(I18n.t("devise.registrations.signed_up"))

		fill_in 'user_email', with: ""
		fill_in 'user_password', with: user.password
		fill_in 'user_password_confirmation', with: user.password_confirmation
		click_button 'Sign up'

		expect(page).to_not have_content(I18n.t("devise.registrations.signed_up"))				
	end
end