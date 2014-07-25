class Rga::CategoriasController < ApplicationController
  before_action :set_rga_categoria, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/categorias
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:categoriatipo])
  end

  # GET /rga/categorias/1
  def show
  end

  # GET /rga/categorias/new
  def new
    @rga_categoria = Rga::Categoria.new
    define_nodo(params[:nodo])
  end

  # GET /rga/categorias/1/edit
  def edit
  end

  # POST /rga/categorias
  def create
    @rga_categoria = Rga::Categoria.new(rga_categoria_params)

    if @rga_categoria.save
      redirect_to rga_categorias_path, notice: 'Categoria guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/categorias/1
  def update
    if @rga_categoria.update(rga_categoria_params)
      flash[:nodo] = @rga_categoria.nodos.first.id rescue nil
      redirect_to rga_categorias_path, notice: 'Categoria actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/categorias/1
  def destroy
    @rga_categoria.destroy
    redirect_to rga_categorias_url, notice: 'Categoria eliminado.'
  end

  def borrar_seleccion
    Rga::Categoria.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_categoria
      @rga_categoria = Rga::Categoria.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_categoria_params
      params.require(:rga_categoria).permit(:estado, :codigo, :nombre, :desc, :pesopromedio, :categoriatipo_id)
    end
end
