module WorkflowModule 
	def self.included(base)
		base.send(:include, AASM)
		base.send(:aasm, column: 'aasm_state', no_direct_assignment: false) do	
			start_aasm(base)
		end
	end

	def start_aasm(base)
		State.where(entity: base.name.downcase).each_with_index do |state_database, index|
			if index == 0
				state state_database.name.to_sym, :initial => true
			else
				state state_database.name.to_sym
			end
		end
		Transition
			.joins(:workflow)
			.where(workflows: { entity: base.name.downcase})
			.each do |transition_database|
				event transition_database.name.to_sym do
					transitions :from => State.where(state_from_id: transition_database.state_from_id).name.to_sym,
								:to => State.where(state_to_id: transition_database.state_to_id).name.to_sym
				end
		end
	end
end