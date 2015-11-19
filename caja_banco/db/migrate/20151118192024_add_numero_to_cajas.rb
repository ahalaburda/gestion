class AddNumeroToCajas < ActiveRecord::Migration
  def change
    add_column :cajas, :numero, :integer
  end
end
