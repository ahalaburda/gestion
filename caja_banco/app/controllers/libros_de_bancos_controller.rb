class LibrosDeBancosController < ApplicationController
  def libro_de_banco
    @movimientos_de_bancos_detalles = MovimientoDeBancoDetalle.all
    @boletas_de_depositos_detalles = BoletaDeDepositoDetalle.all
    @bancos = Banco.all
    @boletas_de_depositos = BoletaDeDeposito.all
    @cheques_propios = ChequePropio.all
  end
end
