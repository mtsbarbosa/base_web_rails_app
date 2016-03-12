class User < ActiveRecord::Base
  ROLES = {admin: "admin", moderator: "moderator", registered: "registered"}.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend WorkflowModule    
end
