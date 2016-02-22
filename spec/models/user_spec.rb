require 'rails_helper'

describe User do
	let!(:user) {FactoryGirl.build(:user)}
	it 'creates the user with registered role' do
		expect(user.role).to eq(User::ROLES[:registered])
	end
end