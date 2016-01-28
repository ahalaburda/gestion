class LibrosDeCajasController < ApplicationController
  def libro_de_caja
  	@movimientos_de_cajas_detalles = MovimientoDeCajaDetalle.all
  	@cheques_entrantes = ChequeEntrante.all
  	@cheques_propios = ChequePropio.all
  end
end
