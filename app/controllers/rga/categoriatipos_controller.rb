class Rga::CategoriatiposController < ApplicationController
  before_action :set_rga_categoriatipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/categoriatipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/categoriatipos/1
  def show
  end

  # GET /rga/categoriatipos/new
  def new
    @rga_categoriatipo = Rga::Categoriatipo.new
    define_nodo(params[:nodo])
  end

  # GET /rga/categoriatipos/1/edit
  def edit
  end

  # POST /rga/categoriatipos
  def create
    @rga_categoriatipo = Rga::Categoriatipo.new(rga_categoriatipo_params)

    if @rga_categoriatipo.save
      @rga_categoriatipo.update_attributes(:estado_ids => params[:rga_categoriatipo][:estado_ids])
      @rga_categoriatipo.update_attributes(:evento_ids => params[:rga_categoriatipo][:evento_ids])
      redirect_to rga_categoriatipos_path, notice: 'Categoriatipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/categoriatipos/1
  def update
    if @rga_categoriatipo.update(rga_categoriatipo_params)
      @rga_categoriatipo.update_attributes(:estado_ids => params[:rga_categoriatipo][:estado_ids])
      @rga_categoriatipo.update_attributes(:evento_ids => params[:rga_categoriatipo][:evento_ids])
      flash[:nodo] = @rga_categoriatipo.nodos.first.id rescue nil
      redirect_to rga_categoriatipos_path, notice: 'Categoriatipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/categoriatipos/1
  def destroy
    @rga_categoriatipo.destroy
    redirect_to rga_categoriatipos_url, notice: 'Categoriatipo eliminado.'
  end

  def borrar_seleccion
    Rga::Categoriatipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_categoriatipo
      @rga_categoriatipo = Rga::Categoriatipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_categoriatipo_params
      params.require(:rga_categoriatipo).permit(:estado, :codigo, :nombre, :desc, :estado_ids, :evento_ids)
    end
end
