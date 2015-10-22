class ChequesEntrantesController < ApplicationController
  before_action :set_cheque_entrante, only: [:show, :edit, :update, :destroy]

  # GET /cheques_entrantes
  # GET /cheques_entrantes.json
  def index
    @cheques_entrantes = ChequeEntrante.all
    @cheque_entrante = ChequeEntrante.new
  end

  # GET /cheques_entrantes/1
  # GET /cheques_entrantes/1.json
  def show
  end

  # GET /cheques_entrantes/new
  def new
    @cheque_entrante = ChequeEntrante.new
  end

  # GET /cheques_entrantes/1/edit
  def edit
    @cheque_entrante = ChequeEntrante.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /cheques_entrantes
  # POST /cheques_entrantes.json
  def create
    @cheque_entrante = ChequeEntrante.new(cheque_entrante_params)

    respond_to do |format|
      if @cheque_entrante.save
        format.html { redirect_to cheques_entrantes_url, notice: 'Cheque entrante was successfully created.' }
        format.json { render :show, status: :created, location: @cheque_entrante }
      else
        format.html { render :new }
        format.json { render json: @cheque_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques_entrantes/1
  # PATCH/PUT /cheques_entrantes/1.json
  def update
    respond_to do |format|
      if @cheque_entrante.update(cheque_entrante_params)
        format.html { redirect_to cheques_entrantes_url, notice: 'Cheque entrante was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque_entrante }
      else
        format.html { render :edit }
        format.json { render json: @cheque_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques_entrantes/1
  # DELETE /cheques_entrantes/1.json
  def destroy
    @cheque_entrante.destroy
    respond_to do |format|
      format.html { redirect_to cheques_entrantes_url, notice: 'Cheque entrante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_entrante
      @cheque_entrante = ChequeEntrante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_entrante_params
      params.require(:cheque_entrante).permit(:banco_id, :numero, :fecha, :monto, :concepto, :persona_id)
    end
end
