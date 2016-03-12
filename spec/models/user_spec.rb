require 'rails_helper'

describe User do
	include WorkflowHelpers

	let!(:user) {FactoryGirl.build(:user)}
	
	before(:each) do
		start_aasm_to_user(user.class)
	end

	describe 'creates user without problems' do

		it 'creates the user with registered role' do
			expect(user.role).to eq(User::ROLES[:registered])
		end

		it 'creates the user with initial state' do
			expect(user.aasm.current_state).to eq(:active)
		end
	end

	describe 'changes the state without problems' do

		it 'changes from active to inactive' do
			user = User.new
			user.inactivate
			expect(user.aasm.current_state).to eq(:inactive)
		end

		it 'changes from inactive to active' do
			user = User.new
			user.inactivate
			user.activate
			expect(user.aasm.current_state).to eq(:active)
		end
	end
end