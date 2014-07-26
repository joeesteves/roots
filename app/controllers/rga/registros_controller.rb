class Rga::RegistrosController < ApplicationController
  before_action :set_rga_registro, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/registros
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/registros/1
  def show
  end

  # GET /rga/registros/new
  def new
    @rga_registro = Rga::Registro.new
    define_nodo(params[:nodo])
  end

  # GET /rga/registros/1/edit
  def edit
  end

  # POST /rga/registros
  def create
    @rga_registro = Rga::Registro.new(rga_registro_params)

    if @rga_registro.save
      @rga_registro.cantidad.times do
        @rga_registro.animales.create()
      end
      redirect_to rga_registros_path, notice: 'Registro guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/registros/1
  def update
    if @rga_registro.update(rga_registro_params)
      flash[:nodo] = @rga_registro.nodos.first.id rescue nil
      redirect_to rga_registros_path, notice: 'Registro actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/registros/1
  def destroy
    @rga_registro.destroy
    redirect_to rga_registros_url, notice: 'Registro eliminado.'
  end

  def borrar_seleccion
    Rga::Registro.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_registro
      @rga_registro = Rga::Registro.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_registro_params
      params.require(:rga_registro).permit(:fecha, :empresa_id, :establecimiento_id, :evento_id, :origcategoria_id, :origrodeo_id, :origestado_id, :destcategoria_id, :destrodeo_id, :destestado_id, :cantidad, :peso, :desc)
    end
end
