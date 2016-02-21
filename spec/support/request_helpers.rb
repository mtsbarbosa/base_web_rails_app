require 'rails_helper'

module AuthenticationHelpers
	def sign_up_in_as!(user)
		visit '/users/sign_up'
		fill_in 'user_email', with: user.email
		fill_in 'user_password', with: user.password
		fill_in 'user_password_confirmation', with: user.password_confirmation
		click_button 'Sign up'
		
	end

	def sign_in_as!(user)
		visit '/users/sign_in'
		fill_in 'user_email', with: user.email
		fill_in 'user_password', with: user.password
		click_button 'Log in'
		
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end