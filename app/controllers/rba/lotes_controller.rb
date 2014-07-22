class Rba::LotesController < ApplicationController
  before_action :set_rba_lote, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/lotes
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/lotes/1
  def show
  end

  # GET /rba/lotes/new
  def new
    @rba_lote = Rba::Lote.new
    define_nodo(params[:nodo])
  end

  # GET /rba/lotes/1/edit
  def edit
  end

  # POST /rba/lotes
  def create
    @rba_lote = Rba::Lote.new(rba_lote_params)

    if @rba_lote.save
      redirect_to rba_lotes_path, notice: 'Lote guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/lotes/1
  def update
    if @rba_lote.update(rba_lote_params)
      flash[:nodo] = @rba_lote.nodos.first.id rescue nil
      redirect_to rba_lotes_path, notice: 'Lote actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/lotes/1
  def destroy
    @rba_lote.destroy
    redirect_to rba_lotes_url, notice: 'Lote eliminado.'
  end

  def borrar_seleccion
    Rba::Lote.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_lote
      @rba_lote = Rba::Lote.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_lote_params
      params.require(:rba_lote).permit(:estado, :codigo, :nombre, :desc, :establecimiento_id)
    end
end
