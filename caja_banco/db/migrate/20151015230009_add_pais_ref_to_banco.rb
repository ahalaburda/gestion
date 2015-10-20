class AddPaisRefToBanco < ActiveRecord::Migration
  def change
    add_index :bancos, :pais
  end
end
