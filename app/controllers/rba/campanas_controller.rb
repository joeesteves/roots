class Rba::CampanasController < ApplicationController
  before_action :set_rba_campana, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/campanas
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:campanatipo, :temporada])
  end

  # GET /rba/campanas/1
  def show
  end

  # GET /rba/campanas/new
  def new
    @rba_campana = Rba::Campana.new
    define_nodo(params[:nodo])
  end

  # GET /rba/campanas/1/edit
  def edit
  end

  # POST /rba/campanas
  def create
    @rba_campana = Rba::Campana.new(rba_campana_params)

    if @rba_campana.save
      redirect_to rba_campanas_path, notice: 'Campana guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/campanas/1
  def update
    if @rba_campana.update(rba_campana_params)
      flash[:nodo] = @rba_campana.nodos.first.id rescue nil
      redirect_to rba_campanas_path, notice: 'Campana actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/campanas/1
  def destroy
    @rba_campana.destroy
    redirect_to rba_campanas_url, notice: 'Campana eliminado.'
  end

  def borrar_seleccion
    Rba::Campana.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_campana
      @rba_campana = Rba::Campana.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_campana_params
      params.require(:rba_campana).permit(:estado, :codigo, :nombre, :desc, :temporada_id, :campanatipo_id)
    end
end
