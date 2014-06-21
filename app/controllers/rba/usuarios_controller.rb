class Rba::UsuariosController < ApplicationController
  before_action :set_rba_usuario, only: [:show, :edit, :update, :destroy]
  skip_before_filter :validar_usuario, only: [:new, :create]
  # GET /rba/usuarios
  # GET /rba/usuarios.json
  def index
    @rba_usuarios = Rba::Usuario.all

  end

  # GET /rba/usuarios/1
  # GET /rba/usuarios/1.json
  def show
  end

  # GET /rba/usuarios/new
  def new
    @rba_usuario = Rba::Usuario.new
  end

  # GET /rba/usuarios/1/edit
  def edit
  end

  # POST /rba/usuarios
  # POST /rba/usuarios.json
  def create
    @rba_usuario = Rba::Usuario.new(rba_usuario_params)

    respond_to do |format|
      if @rba_usuario.save
        format.html { redirect_to rba_usuarios_path, notice: 'Usuario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rba_usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @rba_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rba/usuarios/1
  # PATCH/PUT /rba/usuarios/1.json
  def update
    respond_to do |format|
      if @rba_usuario.update(rba_usuario_params)
        format.html { redirect_to rba_usuarios_path, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rba_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rba/usuarios/1
  # DELETE /rba/usuarios/1.json
  def destroy
    @rba_usuario.destroy
    respond_to do |format|
      format.html { redirect_to rba_usuarios_url }
      format.json { head :no_content }
    end
  end

  def borrar_seleccion
    @rba_usuarios = Rba::Usuario.destroy(params[:ids])
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_usuario
      @rba_usuario = Rba::Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rba_usuario_params
      params.require(:rba_usuario).permit(:usuario, :nombre, :apellido, :mail, :password, :password_confirmation)
    end
end
