class UpdateNilRoles < ActiveRecord::Migration
  def change
  	User.all.each do |user|
  		if user.role.nil?
  			user.update_attribute :role, User::ROLES[:registered]
  		end
  	end
  end
end
