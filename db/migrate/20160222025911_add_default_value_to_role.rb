class AddDefaultValueToRole < ActiveRecord::Migration
  def up
  	change_column :users, :role, :string, :default => User::ROLES[:registered]
  end

  def down
  	change_column :users, :role, :string, :default => nil
  end
end
