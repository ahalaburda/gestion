class AddIndexInBancos < ActiveRecord::Migration
  def change
		add_index :bancos, :departamento_id
		add_index :bancos, :ciudad_id
  end
end
