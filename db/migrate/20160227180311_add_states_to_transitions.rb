class AddStatesToTransitions < ActiveRecord::Migration
  def change
    add_column :transitions, :state_from_id, :integer, references: :states
    add_column :transitions, :state_to_id, :integer, references: :states
    add_index :transitions, :state_from_id
    add_index :transitions, :state_to_id 
    ##add_reference :transitions, :state_from, index: true, foreign_key: true
    ##add_reference :transitions, :state_to, index: true, foreign_key: true
  end
end
