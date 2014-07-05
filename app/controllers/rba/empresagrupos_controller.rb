class Rba::EmpresagruposController < ApplicationController
  before_action :set_rba_empresagrupo, only: [:show, :edit, :update, :destroy]
  

  # GET /rba/empresagrupos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/empresagrupos/1
  def show
  end

  # GET /rba/empresagrupos/new
  def new
    @rba_empresagrupo = Rba::Empresagrupo.new
    define_nodo(params[:nodo])

  end

  # GET /rba/empresagrupos/1/edit
  def edit
  end

  # POST /rba/empresagrupos
  def create
    @rba_empresagrupo = Rba::Empresagrupo.new(rba_empresagrupo_params)

    if @rba_empresagrupo.save
      ubica_en_nodo(params[:nodo])
      flash[:nodo] = @rba_empresagrupo.nodos.first.id rescue nil
      redirect_to rba_empresagrupos_path, notice: 'Empresagrupo guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/empresagrupos/1
  def update
    if @rba_empresagrupo.update(rba_empresagrupo_params)
      flash[:nodo] = @rba_empresagrupo.nodos.first.id rescue nil
      redirect_to rba_empresagrupos_path  , notice: 'Empresagrupo actualizado.' 
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/empresagrupos/1
  def destroy
    @rba_empresagrupo.destroy
    redirect_to rba_empresagrupos_url, notice: 'Empresagrupo eliminado.'
  end

  def borrar_seleccion
    Rba::Empresagrupo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_empresagrupo
      @rba_empresagrupo = Rba::Empresagrupo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_empresagrupo_params
      params.require(:rba_empresagrupo).permit(:codigo, :nombre, :desc)
    end
end
