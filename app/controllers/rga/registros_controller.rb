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
    codigoEvento = @rga_registro.evento.eventotipo.codigo.to_i

    if @rga_registro.save
      cantidad = @rga_registro.cantidad
      cantidad.times do
      case codigoEvento
        when -1
          a = @rga_registro
          animalesOrigen = Rga::Animal.disponibles(a.empresa_id, a.establecimiento_id, 
            a.origcategoria_id, a.origrodeo_id, a.origestado_id, {cantidad: cantidad.to_s})
          animalesOrigen.each do |ao|
            ao.update_attributes(:estado => 0)
          end
          @rga_registro.update_attributes(:animal_ids => animalesOrigen.collect(&:id))
        when 1
          @rga_registro.animales.create()
        end
      end
      
      redirect_to rga_registros_path, notice: 'Registro guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/registros/1
  def update
    # El codigo del evento determina el comportamiento
    #  -1 Egresos // 0 Partos // 1 Ingresos // 2 Cambios de categoria

    codigoEvento = @rga_registro.evento.eventotipo.codigo.to_i
    cantidadInicial = @rga_registro.cantidad
    cantidadFinal = (params[:rga_registro][:cantidad]).to_i
    diferencia = cantidadFinal - cantidadInicial
    animales = @rga_registro.animales
    case codigoEvento
      when 1 # Ingresos si se actualiza en menos borra los animales excendentes
        if diferencia > 0
           diferencia.times do
            @rga_registro.animales.create()
          end
        elsif diferencia < 0 
          @rga_registro.animales.last(diferencia.abs).each(&:destroy)
        end
      when 2 # Cambios de cateogria si se actualiza en menos borra los animales excendentes
        # Si la diferencia es + Buscar animales en orgien, si hay disponibles agregarlos
        # Si la diferencia es - solo borrar la relacion
        if diferencia < 0 
          @rga_registro.animales.delete(animales.last(diferencia.abs))
        end
    
    end


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
