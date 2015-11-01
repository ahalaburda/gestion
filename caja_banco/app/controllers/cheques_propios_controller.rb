class ChequesPropiosController < ApplicationController
  before_action :set_cheque_propio, only: [:show, :edit, :update, :destroy]

  # GET /cheques_propios
  # GET /cheques_propios.json
  def index
    @cheques_propios = ChequePropio.all
    @cheque_propio = ChequePropio.new
  end

  # GET /cheques_propios/1
  # GET /cheques_propios/1.json
  def show
  end

  # GET /cheques_propios/new
  def new
    @cheque_propio = ChequePropio.new
  end

  # GET /cheques_propios/1/edit
  def edit
    @cheque_propio = ChequePropio.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /cheques_propios
  # POST /cheques_propios.json
  def create
    @cheque_propio = ChequePropio.new(cheque_propio_params)

    respond_to do |format|
      if @cheque_propio.save
        format.html { redirect_to cheques_propios_url, notice: 'Cheque propio was successfully created.' }
        format.json { render :show, status: :created, location: @cheque_propio }
      else
        format.html { render :new }
        format.json { render json: @cheque_propio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques_propios/1
  # PATCH/PUT /cheques_propios/1.json
  def update
    respond_to do |format|
      if @cheque_propio.update(cheque_propio_params)
        format.html { redirect_to cheques_propios_url, notice: 'Cheque propio was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque_propio }
      else
        format.html { render :edit }
        format.json { render json: @cheque_propio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques_propios/1
  # DELETE /cheques_propios/1.json
  def destroy
    @cheque_propio.destroy
    respond_to do |format|
      format.html { redirect_to cheques_propios_url, notice: 'Cheque propio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_propio
      @cheque_propio = ChequePropio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_propio_params
      params.require(:cheque_propio).permit(:chequera_id, :numero_cheque, :fecha, :concepto, :monto)
    end
end