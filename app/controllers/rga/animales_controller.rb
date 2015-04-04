class Rga::AnimalesController < ApplicationController
  before_action :set_rga_animal, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/animales
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:padre, :madre])
  end

  # GET /rga/animales/1
  def show
  end

  # GET /rga/animales/new
  def new
    @rga_animal = Rga::Animal.new
    define_nodo(params[:nodo])
  end

  # GET /rga/animales/1/edit
  def edit
  end

  # POST /rga/animales
  def create
    @rga_animal = Rga::Animal.new(rga_animal_params)

    if @rga_animal.save
      redirect_to rga_animales_path, notice: 'Animal guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/animales/1
  def update
    if @rga_animal.update(rga_animal_params)
      flash[:nodo] = @rga_animal.nodos.first.id rescue nil
      redirect_to rga_animales_path, notice: 'Animal actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/animales/1
  def destroy
    @rga_animal.destroy
    redirect_to rga_animales_url, notice: 'Animal eliminado.'
  end

  def borrar_seleccion
    Rga::Animal.destroy(params[:ids]) 
    render nothing: true  
  end

  def disponibles
    empresa_id = @empresa_actual.id
    establecimiento_id = @establecimiento_actual.id
    origcategoria_id = params[:origcategoria_id]
    origrodeo_id = params[:origrodeo_id]
    origestado_id = params[:origestado_id]
    animales = Rga::Animal.disponibles(empresa_id, establecimiento_id, origcategoria_id, origrodeo_id, origestado_id)
    @disponibles = animales.count
   
    respond_to do |format|
      format.js
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_animal
      @rga_animal = Rga::Animal.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_animal_params
      params.require(:rga_animal).permit(:estado, :codigo, :nombre, :alias, :rp, :color, :desc, :madre_id, :padre_id)
    end
end
