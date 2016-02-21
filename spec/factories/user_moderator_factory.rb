FactoryGirl.define do
	factory :user_moderator, class: User do
		email 'sample_moderator@sample.com'
		password "MyString"
		password_confirmation "MyString"
		role User::ROLES[:moderator]
	end	
end