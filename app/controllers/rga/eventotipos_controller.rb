class Rga::EventotiposController < ApplicationController
  before_action :set_rga_eventotipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/eventotipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/eventotipos/1
  def show
  end

  # GET /rga/eventotipos/new
  def new
    @rga_eventotipo = Rga::Eventotipo.new
    define_nodo(params[:nodo])
  end

  # GET /rga/eventotipos/1/edit
  def edit
  end

  # POST /rga/eventotipos
  def create
    @rga_eventotipo = Rga::Eventotipo.new(rga_eventotipo_params)

    if @rga_eventotipo.save
      redirect_to rga_eventotipos_path, notice: 'Eventotipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/eventotipos/1
  def update
    if @rga_eventotipo.update(rga_eventotipo_params)
      flash[:nodo] = @rga_eventotipo.nodos.first.id rescue nil
      redirect_to rga_eventotipos_path, notice: 'Eventotipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/eventotipos/1
  def destroy
    @rga_eventotipo.destroy
    redirect_to rga_eventotipos_url, notice: 'Eventotipo eliminado.'
  end

  def borrar_seleccion
    Rga::Eventotipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_eventotipo
      @rga_eventotipo = Rga::Eventotipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_eventotipo_params
      params.require(:rga_eventotipo).permit(:estado, :codigo, :nombre, :desc)
    end
end
