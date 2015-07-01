class Rba::UsuariosController < ApplicationController
  before_action :set_rba_usuario, only: [:show, :edit, :update, :destroy]
  # skip_before_filter :validar_usuario, only: [:new, :create]
 
 
  # GET /rba/usuarios
  # GET /rba/usuarios.json
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/usuarios/1
  # GET /rba/usuarios/1.json
  def show
  end

  # GET /rba/usuarios/new
  def new
    @rba_usuario = Rba::Usuario.new
    define_nodo(params[:nodo])
  end

  # GET /rba/usuarios/1/edit
  def edit
  end

  # POST /rba/usuarios
  # POST /rba/usuarios.json
  def create
    @rba_usuario = Rba::Usuario.new(rba_usuario_params)

    if @rba_usuario.save
      ubica_en_nodo(params[:nodo])
      flash[:nodo] = @rba_usuario.nodos.first.id rescue nil
      redirect_to rba_usuarios_path, notice: 'Usuario guardado'
    else

      render action: 'new'
    end

   
  end

  # PATCH/PUT /rba/usuarios/1
  # PATCH/PUT /rba/usuarios/1.json
  def update
    if @rba_usuario.update(rba_usuario_params)
      flash[:nodo] = @rba_usuario.nodos.first.id rescue nil
      redirect_to rba_usuarios_path  , notice: 'Usuario actualizado.' 
    else
      render action: 'edit'
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
