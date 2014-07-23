class Rga::RodeosController < ApplicationController
  before_action :set_rga_rodeo, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/rodeos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/rodeos/1
  def show
  end

  # GET /rga/rodeos/new
  def new
    @rga_rodeo = Rga::Rodeo.new
    define_nodo(params[:nodo])
  end

  # GET /rga/rodeos/1/edit
  def edit
  end

  # POST /rga/rodeos
  def create
    @rga_rodeo = Rga::Rodeo.new(rga_rodeo_params)

    if @rga_rodeo.save
      redirect_to rga_rodeos_path, notice: 'Rodeo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/rodeos/1
  def update
    if @rga_rodeo.update(rga_rodeo_params)
      flash[:nodo] = @rga_rodeo.nodos.first.id rescue nil
      redirect_to rga_rodeos_path, notice: 'Rodeo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/rodeos/1
  def destroy
    @rga_rodeo.destroy
    redirect_to rga_rodeos_url, notice: 'Rodeo eliminado.'
  end

  def borrar_seleccion
    Rga::Rodeo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_rodeo
      @rga_rodeo = Rga::Rodeo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_rodeo_params
      params.require(:rga_rodeo).permit(:estado, :codigo, :nombre, :desc)
    end
end
