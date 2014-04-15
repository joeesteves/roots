class Rb::UsuariosController < ApplicationController
  before_action :set_rb_usuario, only: [:show, :edit, :update, :destroy]
  skip_before_filter :validar_usuario, only: [:new, :create]
  # GET /rb/usuarios
  # GET /rb/usuarios.json
  def index
    @rb_usuarios = Rb::Usuario.all
  end

  # GET /rb/usuarios/1
  # GET /rb/usuarios/1.json
  def show
  end

  # GET /rb/usuarios/new
  def new
    @rb_usuario = Rb::Usuario.new
  end

  # GET /rb/usuarios/1/edit
  def edit
  end

  # POST /rb/usuarios
  # POST /rb/usuarios.json
  def create
    @rb_usuario = Rb::Usuario.new(rb_usuario_params)

    respond_to do |format|
      if @rb_usuario.save
        format.html { redirect_to @rb_usuario, notice: 'Usuario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rb_usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @rb_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rb/usuarios/1
  # PATCH/PUT /rb/usuarios/1.json
  def update
    respond_to do |format|
      if @rb_usuario.update(rb_usuario_params)
        format.html { redirect_to @rb_usuario, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rb_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rb/usuarios/1
  # DELETE /rb/usuarios/1.json
  def destroy
    @rb_usuario.destroy
    respond_to do |format|
      format.html { redirect_to rb_usuarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rb_usuario
      @rb_usuario = Rb::Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rb_usuario_params
      params.require(:rb_usuario).permit(:usuario, :nombre, :apellido, :mail, :password, :password_confirmation)
    end
end
