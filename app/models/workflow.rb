class Workflow < ActiveRecord::Base
	has_many :transitions
	validates :name, presence: true,
					 length: { minimum: 5},
					 uniqueness: { :scope => :entity }
end
