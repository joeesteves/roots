class Rba::EstablecimientosController < ApplicationController
  before_action :set_rba_establecimiento, only: [:show, :edit, :update, :destroy]

  # GET /rba/establecimientos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], :contexto => "grupo")
  end

  # GET /rba/establecimientos/1
  def show
  end

  # GET /rba/establecimientos/new
  def new
    @rba_establecimiento = Rba::Establecimiento.new
    define_nodo(params[:nodo])
  end

  # GET /rba/establecimientos/1/edit
  def edit
  end

  # POST /rba/establecimientos
  def create
    @rba_establecimiento = Rba::Establecimiento.new(rba_establecimiento_params)
    @rba_establecimiento.empresagrupo_id = session[:empresagrupo_id]
    if @rba_establecimiento.save
      redirect_to rba_establecimientos_path, notice: 'Establecimiento guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/establecimientos/1
  def update
    if @rba_establecimiento.update(rba_establecimiento_params)
      flash[:nodo] = @rba_establecimiento.nodos.first.id rescue nil
      redirect_to rba_establecimientos_path, notice: 'Establecimiento actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/establecimientos/1
  def destroy
    @rba_establecimiento.destroy
    redirect_to rba_establecimientos_url, notice: 'Establecimiento eliminado.'
  end

  def borrar_seleccion
    Rba::Establecimiento.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_establecimiento
      @rba_establecimiento = Rba::Establecimiento.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_establecimiento_params
      params.require(:rba_establecimiento).permit(:estado, :codigo, :nombre, 
        :desc, :superficie,  
        lotes_attributes: [:id, :codigo, :nombre, :estado, :desc, :_destroy])
    end
end
