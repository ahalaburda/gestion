class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new

    respond_to do |format|
      format.html # show.html.erb
			format.pdf { render_users_list(@users)}
      format.json { render json: @user }
      format.js
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
     @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      format.js
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username,:persona_id, :email, :password, :password_confirmation)
    end

	def render_users_list(user)
		report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'users', 'show.tlf')

		user.each do |task|
			report.list.add_row do |row|
				row.values usuario: task.username
				row.values nombre: task.persona.nombre_apellido
				row.values correo: task.email
				row.values creacion: task.created_at
				row.values conexion: task.current_sign_in_at
				row.item(:usuario).style(:color, 'red')
				row.item(:nombre).style(:color, 'red')
				row.item(:correo).style(:color, 'red')
				row.item(:creacion).style(:color, 'red')
				row.item(:conexion).style(:color, 'red')
			end
		end
	 report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
	 report.page.item(:elaboracion).value(current_user.username)
	 report.page.item(:fecha_elaboracion).value(Time.current.to_s)
		send_data report.generate, filename: 'usuarios.pdf',
															 type: 'application/pdf',
															 disposition: 'attachment'
	end
end
