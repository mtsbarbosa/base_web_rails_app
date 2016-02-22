FactoryGirl.define do
	factory :user do
		email 'sample@sample.com'
		password "MyString"
		password_confirmation "MyString"
	end
end