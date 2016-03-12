require 'rails_helper'

module WorkflowHelpers
	def start_aasm_to_user(user)
		if(!user.respond_to?('aasm'))
			Rails.logger.debug 'teste'
			state_active = FactoryGirl.build(:state_active)
			state_inactive = FactoryGirl.build(:state_inactive)
			user_workflow = FactoryGirl.build(:user_workflow)
			transition_activate = FactoryGirl.build(:transition_activate, workflow: user_workflow)
			transition_inactivate = FactoryGirl.build(:transition_inactivate, workflow: user_workflow)
			user.send(:include, AASM)
			user.send(:aasm, column: 'aasm_state', no_direct_assignment: false) do	
				state state_active.name.to_sym, :initial => true
				state state_inactive.name.to_sym

				event transition_activate.name.to_sym do
					transitions :from => state_inactive.name.to_sym,
								:to => state_active.name.to_sym
				end

				event transition_inactivate.name.to_sym do
					transitions :from => state_active.name.to_sym,
								:to => state_inactive.name.to_sym
				end
			end
		end
	end
end

RSpec.configure do |c|
	c.include WorkflowHelpers, type: :feature
end