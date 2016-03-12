class State < ActiveRecord::Base
	has_many :transitions, :foreign_key => "state_from_id"
	has_many :transitions, :foreign_key => "state_to_id"
	validates :name, presence: true,
					 length: { minimum: 5},
					 uniqueness: { :scope => :entity }
end
