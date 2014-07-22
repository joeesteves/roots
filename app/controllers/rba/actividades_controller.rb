class Rba::ActividadesController < ApplicationController
  before_action :set_rba_actividad, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/actividades
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/actividades/1
  def show
  end

  # GET /rba/actividades/new
  def new
    @rba_actividad = Rba::Actividad.new
    define_nodo(params[:nodo])
  end

  # GET /rba/actividades/1/edit
  def edit
  end

  # POST /rba/actividades
  def create
    @rba_actividad = Rba::Actividad.new(rba_actividad_params)

    if @rba_actividad.save
      redirect_to rba_actividades_path, notice: 'Actividad guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/actividades/1
  def update
    if @rba_actividad.update(rba_actividad_params)
      flash[:nodo] = @rba_actividad.nodos.first.id rescue nil
      redirect_to rba_actividades_path, notice: 'Actividad actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/actividades/1
  def destroy
    @rba_actividad.destroy
    redirect_to rba_actividades_url, notice: 'Actividad eliminado.'
  end

  def borrar_seleccion
    Rba::Actividad.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_actividad
      @rba_actividad = Rba::Actividad.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_actividad_params
      params.require(:rba_actividad).permit(:codigo, :nombre, :estado, :desc, :actividadtipo_id)
    end
end
