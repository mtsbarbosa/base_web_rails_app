FactoryGirl.define do
	factory :user_workflow, class: Workflow do
		name "user_workflow"
		entity "user"
	end
end