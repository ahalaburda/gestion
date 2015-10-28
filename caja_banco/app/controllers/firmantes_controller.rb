class FirmantesController < ApplicationController
  before_action :set_firmante, only: [:show, :edit, :update, :destroy]

  # GET /firmantes
  # GET /firmantes.json
  def index
    @firmantes = Firmante.all
    @firmante = Firmante.new
  end

  # GET /firmantes/1
  # GET /firmantes/1.json
  def show
  end

  # GET /firmantes/new
  def new
    @firmante = Firmante.new
  end

  # GET /firmantes/1/edit
  def edit
  end

  # POST /firmantes
  # POST /firmantes.json
  def create
    @firmante = Firmante.new(firmante_params)

    respond_to do |format|
      if @firmante.save
        format.html { redirect_to firmante_url, notice: 'Firmante was successfully created.' }
        format.json { render :show, status: :created, location: @firmante }
      else
        format.html { render :new }
        format.json { render json: @firmante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firmantes/1
  # PATCH/PUT /firmantes/1.json
  def update
    respond_to do |format|
      if @firmante.update(firmante_params)
        format.html { redirect_to firmante_url, notice: 'Firmante was successfully updated.' }
        format.json { render :show, status: :ok, location: @firmante }
      else
        format.html { render :edit }
        format.json { render json: @firmante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firmantes/1
  # DELETE /firmantes/1.json
  def destroy
    @firmante.destroy
    respond_to do |format|
      format.html { redirect_to firmantes_url, notice: 'Firmante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firmante
      @firmante = Firmante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firmante_params
      params.require(:firmante).permit(:cuenta_bancaria_id, :persona_id)
    end
end
