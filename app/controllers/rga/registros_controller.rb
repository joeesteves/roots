class Rga::RegistrosController < ApplicationController
  before_action :set_rga_registro, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/registros
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:origestado, :destestado, 
      :origcategoria, :destcategoria, :origrodeo, :destrodeo, :evento])
  end

  # GET /rga/registros/1
  def show
  end

  # GET /rga/registros/new
  def new
    @rga_registro = Rga::Registro.new
    @rga_registro.establecimiento = @establecimiento_actual
    @rga_registro.empresa = @empresa_actual
    define_nodo(params[:nodo])
    @eventoTipoCodigo = Rga::Evento.first.eventotipo.codigo
  end

  # GET /rga/registros/1/edit
  def edit
    @eventoTipoCodigo = @rga_registro.evento.eventotipo.codigo
  end

  # POST /rga/registros
  def create
    @rga_registro = Rga::Registro.new(rga_registro_params)
    @rga_registro.establecimiento = @establecimiento_actual
    @rga_registro.empresa = @empresa_actual
   
    if @rga_registro.rSave
      
      redirect_to rga_registros_path, notice: 'Registro guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/registros/1
  def update
   cantidadFinal = (params[:rga_registro][:cantidad]).to_i
    if @rga_registro.rUpdate(rga_registro_params, cantidadFinal)
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

  def mostrar_planilla
    @desde = params[:desde] || Date.today.at_beginning_of_month
    @hasta = params[:hasta] || Date.today.end_of_month
    @categorias_inicio = Rga::Categoria.categorias_disponibles(session[:empresa_id],session[:establecimiento_id], fecha: @desde)
    @categorias_fin = Rga::Categoria.categorias_disponibles(session[:empresa_id],session[:establecimiento_id], fecha: @hasta)
    @categorias = @categorias_inicio | @categorias_fin 

  end

  def mostrar_existencia
  
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
