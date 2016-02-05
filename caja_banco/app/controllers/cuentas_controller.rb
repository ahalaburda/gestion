class CuentasController < ApplicationController
  before_action :set_cuenta, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cuentas = Cuenta.all
    respond_with(@cuentas)
  end

  def show
    respond_with(@cuenta)
  end

  def new
    @cuenta = Cuenta.new
    respond_with(@cuenta)
  end

  def edit
  end

  def create
    @cuenta = Cuenta.new(cuenta_params)
    @cuenta.save
    respond_with(@cuenta)
  end

  def update
    @cuenta.update(cuenta_params)
    respond_with(@cuenta)
  end

  def destroy
    @cuenta.destroy
    respond_with(@cuenta)
  end

  private
    def set_cuenta
      @cuenta = Cuenta.find(params[:id])
    end

    def cuenta_params
      params.require(:cuenta).permit(:numero_cuenta_contable, :descripcion)
    end
end
