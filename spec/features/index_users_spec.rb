require 'rails_helper'

RSpec.feature "View list of users" do
	let!(:user) {FactoryGirl.build(:user)}
	let!(:user_admin) {FactoryGirl.create(:user_admin)}
	let!(:user_moderator) {FactoryGirl.create(:user_moderator)}

	scenario 'Successful list showed' do
		sign_in_as!(user_admin)
		click_link I18n.t("user._entity_index")

		expect(page).to have_content(user_admin.email)

		click_link I18n.t("session._sign_out")

		sign_in_as!(user_moderator)
		click_link I18n.t("user._entity_index")

		expect(page).to have_content(user_moderator.email)
	end

	scenario 'List not showed for non admin and non moderators' do
		sign_up_in_as!(user)
		
		expect(page).to_not have_content(I18n.t("user._entity_index"))
	end
end