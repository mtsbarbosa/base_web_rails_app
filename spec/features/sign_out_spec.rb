require 'rails_helper'

RSpec.feature "Signing out" do
	let!(:user) {FactoryGirl.build(:user)}

	scenario 'Successful sign out' do
		sign_up_in_as!(user)
		visit '/'
		click_link I18n.t("session._sign_out")

		expect(page).to have_content(I18n.t("devise.sessions.signed_out"))
	end
end