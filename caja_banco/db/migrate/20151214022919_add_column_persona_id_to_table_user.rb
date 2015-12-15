class AddColumnPersonaIdToTableUser < ActiveRecord::Migration
  def change
  	add_column :users, :persona_id, :string
  	add_index :users, :persona_id
  end
end
