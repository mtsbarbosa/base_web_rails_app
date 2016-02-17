require 'rails_helper'

RSpec.feature "Show users" do
	let!(:user) {FactoryGirl.build(:user)}

	scenario 'Successful user showed' do
		sign_up_in_as!(user)
		visit '/'
		click_link I18n.t("user._entity_index")
		click_link user.email

		expect(page).to have_content(I18n.t("user._entity"))
		expect(page).to have_content(user.email)
	end
end