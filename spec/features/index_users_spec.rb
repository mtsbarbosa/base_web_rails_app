require 'rails_helper'

RSpec.feature "View list of users" do
	let!(:user) {FactoryGirl.build(:user)}

	scenario 'Successful list showed' do
		sign_up_in_as!(user)
		click_link I18n.t("user._entity_index")

		expect(page).to have_content(user.email)
	end
end