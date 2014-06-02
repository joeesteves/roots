class PruebasController < ApplicationController
  before_action :set_prueba, only: [:show, :edit, :update, :destroy]

  # GET /pruebas
  def index
    @pruebas = Prueba.all
  end

  # GET /pruebas/1
  def show
  end

  # GET /pruebas/new
  def new
    @prueba = Prueba.new
  end

  # GET /pruebas/1/edit
  def edit
  end

  # POST /pruebas
  def create
    @prueba = Prueba.new(prueba_params)

    if @prueba.save
      redirect_to pruebas_path, notice: 'Prueba guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pruebas/1
  def update
    if @prueba.update(prueba_params)
      redirect_to pruebas_path, notice: 'Prueba actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pruebas/1
  def destroy
    @prueba.destroy
    redirect_to pruebas_url, notice: 'Prueba eliminado.'
  end
  def delete_selection
    Prueba.delete(params[:ids])
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba
      @prueba = Prueba.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prueba_params
      params.require(:prueba).permit(:nombre, :apellido, :telefono)
    end
end
