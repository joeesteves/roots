class Rba::CampanatiposController < ApplicationController
  before_action :set_rba_campanatipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/campanatipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/campanatipos/1
  def show
  end

  # GET /rba/campanatipos/new
  def new
    @rba_campanatipo = Rba::Campanatipo.new
    define_nodo(params[:nodo])
  end

  # GET /rba/campanatipos/1/edit
  def edit
  end

  # POST /rba/campanatipos
  def create
    @rba_campanatipo = Rba::Campanatipo.new(rba_campanatipo_params)

    if @rba_campanatipo.save
      redirect_to rba_campanatipos_path, notice: 'Campanatipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/campanatipos/1
  def update
    if @rba_campanatipo.update(rba_campanatipo_params)
      flash[:nodo] = @rba_campanatipo.nodos.first.id rescue nil
      redirect_to rba_campanatipos_path, notice: 'Campanatipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/campanatipos/1
  def destroy
    @rba_campanatipo.destroy
    redirect_to rba_campanatipos_url, notice: 'Campanatipo eliminado.'
  end

  def borrar_seleccion
    Rba::Campanatipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_campanatipo
      @rba_campanatipo = Rba::Campanatipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_campanatipo_params
      params.require(:rba_campanatipo).permit(:estado, :codigo, :nombre, :desc)
    end
end
