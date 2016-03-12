class Transition < ActiveRecord::Base
  belongs_to :workflow
  validates :name, presence: true,
					 length: { minimum: 5},
					 uniqueness: { :scope => :workflow }
end
