class AddPaisRefToBanco < ActiveRecord::Migration
  def change
    add_index :bancos, :pais_id
  end
end
