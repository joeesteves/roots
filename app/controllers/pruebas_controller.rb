class PruebasController < ApplicationController
  before_action :set_prueba, only: [:show, :edit, :update, :destroy]
  include Globales

  # GET /pruebas
  def index
    arbol_index(params[:nodo])
  end

  # GET /pruebas/1
  def show
  end

  # GET /pruebas/new
  def new
    @prueba = Prueba.new
    define_nodo(params[:nodo])
  end

  # GET /pruebas/1/edit
  def edit
  end

  # POST /pruebas
  def create
    @prueba = Prueba.new(prueba_params)

    if @prueba.save
      redirect_to pruebas_path, notice: 'Prueba guardado.'
      ubica_en_nodo(params[:nodo])
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

  def borrar_seleccion
    Prueba.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba
      @prueba = Prueba.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def prueba_params
      params.require(:prueba).permit(:nombre, :apellido)
    end
end
