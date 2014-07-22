class Rba::ActividadtiposController < ApplicationController
  before_action :set_rba_actividadtipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/actividadtipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/actividadtipos/1
  def show
  end

  # GET /rba/actividadtipos/new
  def new
    @rba_actividadtipo = Rba::Actividadtipo.new
    define_nodo(params[:nodo])
  end

  # GET /rba/actividadtipos/1/edit
  def edit
  end

  # POST /rba/actividadtipos
  def create
    @rba_actividadtipo = Rba::Actividadtipo.new(rba_actividadtipo_params)

    if @rba_actividadtipo.save
      redirect_to rba_actividadtipos_path, notice: 'Actividadtipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/actividadtipos/1
  def update
    if @rba_actividadtipo.update(rba_actividadtipo_params)
      flash[:nodo] = @rba_actividadtipo.nodos.first.id rescue nil
      redirect_to rba_actividadtipos_path, notice: 'Actividadtipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/actividadtipos/1
  def destroy
    @rba_actividadtipo.destroy
    redirect_to rba_actividadtipos_url, notice: 'Actividadtipo eliminado.'
  end

  def borrar_seleccion
    Rba::Actividadtipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_actividadtipo
      @rba_actividadtipo = Rba::Actividadtipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_actividadtipo_params
      params.require(:rba_actividadtipo).permit(:codigo, :nombre, :estado)
    end
end
