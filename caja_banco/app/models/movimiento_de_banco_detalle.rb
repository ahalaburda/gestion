class MovimientoDeBancoDetalle < ActiveRecord::Base
  audited
  belongs_to :movimiento_de_banco
  belongs_to :cuenta_bancaria

  validates :cuenta_bancaria_id, presence: true
  validates :monto, presence: true

  after_create :actualizar_saldo_cuenta

  def actualizar_saldo_cuenta
    mov = MovimientoDeBanco.last
    cuenta = CuentaBancaria.find(self.cuenta_bancaria_id)
    if mov.tipo_de_movimiento.descripcion == 'Ingreso'
      cuenta.saldo += mov.total
    else
      cuenta.saldo -= mov.total
    end
    cuenta.save
  end
end
