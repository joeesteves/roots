class Rad::OperacionesController < ApplicationController
  before_action :set_rad_operacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rad/operaciones
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rad/operaciones/1
  def show
  end

  # GET /rad/operaciones/new
  def new
    @rad_operacion = Rad::Operacion.new
    define_nodo(params[:nodo])
    @operacionTipoDefault = Rad::Operaciontipo.where(:codigo => -1).last.id
  end

  # GET /rad/operaciones/1/edit
  def edit
  end

  # POST /rad/operaciones
  def create

    @rad_operacion = Rad::Operacion.new(rad_operacion_params)
    @rad_operacion.empresa_id = session[:empresa_id] 


    if @rad_operacion.rSave
      redirect_to rad_operaciones_path, notice: 'Operacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      
      render action: 'new'
    end
  end

  # PATCH/PUT /rad/operaciones/1
  def update
    if @rad_operacion.rUpdate(rad_operacion_params)
      flash[:nodo] = @rad_operacion.nodos.first.id rescue nil
      redirect_to rad_operaciones_path, notice: 'Operacion actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rad/operaciones/1
  def destroy
    @rad_operacion.destroy
    redirect_to rad_operaciones_url, notice: 'Operacion eliminado.'
  end

  def borrar_seleccion
    Rad::Operacion.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rad_operacion
      @rad_operacion = Rad::Operacion.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rad_operacion_params
      params.require(:rad_operacion).permit(:fecha, :importe, :operaciontipo_id, :cuotas, 
        :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :esgenerado, :empresa_id, :rdosxmes)
    end
end
