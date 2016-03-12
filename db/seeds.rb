# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
state_active = State.where(name: 'active', entity: 'user').first
if(state_active.nil?)
	state_active = 
		State.create! :name => 'active', :entity => 'user'
end
state_inactive = State.where(name: 'inactive', entity: 'user').first
if(state_inactive.nil?)
	state_inactive = 
		State.create! :name => 'inactive', :entity => 'user'
end
user_workflow = Workflow.where(name: 'user_workflow', entity: 'user').first
if(user_workflow.nil?)
	user_workflow = 
		Workflow.create! :name => 'user_workflow', :entity => 'user'
end
t_activate = Transition.where(name: 'activate', workflow: user_workflow).first
if(t_activate.nil?)
	t_activate = Transition.create! :name => 'activate', 
					   :workflow => user_workflow,
					   :state_from_id => state_inactive.id,
					   :state_to_id => state_active.id
end
t_inactivate = Transition.where(name: 'inactivate', workflow: user_workflow).first
if(t_inactivate.nil?)
	t_inactivate = Transition.create! :name => 'inactivate', 
					   :workflow => user_workflow,
					   :state_from_id => state_active.id,
					   :state_to_id => state_inactive.id
end
if User.where(email: 'sample_admin@sample.com').empty?
	User.create! :email => 'sample_admin@sample.com', 
					:password => 'MyString', 
					:password_confirmation => 'MyString', 
					:role => User::ROLES[:admin],
					:aasm_state => state_active.name
end
if User.where(email: 'sample_moderator@sample.com').empty?
	User.create! :email => 'sample_moderator@sample.com', 
					:password => 'MyString', 
					:password_confirmation => 'MyString', 
					:role => User::ROLES[:moderator],
					:aasm_state => state_active.name
end