class AddStatesToTransitions < ActiveRecord::Migration
  def change
    add_reference :transitions, :state_from, index: true, foreign_key: true
    add_reference :transitions, :state_to, index: true, foreign_key: true
  end
end
