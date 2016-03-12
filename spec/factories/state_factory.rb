FactoryGirl.define do
	factory :state_active, class: State do
		name "active"
		entity "user"
	end

	factory :state_inactive, class: State do
		name "inactive"
		entity "user"
	end
end