FactoryGirl.define do
	factory :transition_activate, class: Transition do
		name "activate"
	end

	factory :transition_inactivate, class: Transition do
		name "inactivate"
	end
end