class AddEstadoAndCajaToChequeEntrante < ActiveRecord::Migration
  def change
    add_reference :cheques_entrantes, :caja, index: true
    add_reference :cheques_entrantes, :estado, index: true
  end
end
