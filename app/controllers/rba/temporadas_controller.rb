class Rba::TemporadasController < ApplicationController
  before_action :set_rba_temporada, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/temporadas
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/temporadas/1
  def show
  end

  # GET /rba/temporadas/new
  def new
    @rba_temporada = Rba::Temporada.new
    define_nodo(params[:nodo])
  end

  # GET /rba/temporadas/1/edit
  def edit
  end

  # POST /rba/temporadas
  def create
    @rba_temporada = Rba::Temporada.new(rba_temporada_params)

    if @rba_temporada.save
      redirect_to rba_temporadas_path, notice: 'Temporada guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/temporadas/1
  def update
    if @rba_temporada.update(rba_temporada_params)
      flash[:nodo] = @rba_temporada.nodos.first.id rescue nil
      redirect_to rba_temporadas_path, notice: 'Temporada actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/temporadas/1
  def destroy
    @rba_temporada.destroy
    redirect_to rba_temporadas_url, notice: 'Temporada eliminado.'
  end

  def borrar_seleccion
    Rba::Temporada.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_temporada
      @rba_temporada = Rba::Temporada.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_temporada_params
      params.require(:rba_temporada).permit(:estado, :codigo, :nombre, :desc, :desde, :hasta)
    end
end
