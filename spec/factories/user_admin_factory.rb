FactoryGirl.define do
	factory :user_admin, class: User do
		email 'sample_admin@sample.com'
		password "MyString"
		password_confirmation "MyString"
		role User::ROLES[:admin]
		aasm_state "active"
	end
end