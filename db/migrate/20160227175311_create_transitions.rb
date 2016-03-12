class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.string :name
      t.references :workflow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
