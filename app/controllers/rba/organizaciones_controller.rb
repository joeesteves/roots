class Rba::OrganizacionesController < ApplicationController
  before_action :set_rba_organizacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/organizaciones
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], contexto: "grupo")
  end

  # GET /rba/organizaciones/1
  def show
  end

  # GET /rba/organizaciones/new
  def new
    @rba_organizacion = Rba::Organizacion.new
    define_nodo(params[:nodo])
  end

  # GET /rba/organizaciones/1/edit
  def edit
  end

  # POST /rba/organizaciones
  def create
    @rba_organizacion = Rba::Organizacion.new(rba_organizacion_params)
    @rba_organizacion.empresagrupo_id = session[:empresagrupo_id]

    if @rba_organizacion.save
      redirect_to rba_organizaciones_path, notice: 'Organizacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/organizaciones/1
  def update
    if @rba_organizacion.update(rba_organizacion_params)
      flash[:nodo] = @rba_organizacion.nodos.first.id rescue nil
      redirect_to rba_organizaciones_path, notice: 'Organizacion actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/organizaciones/1
  def destroy
    @rba_organizacion.destroy
    redirect_to rba_organizaciones_url, notice: 'Organizacion eliminado.'
  end

  def borrar_seleccion
    Rba::Organizacion.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_organizacion
      @rba_organizacion = Rba::Organizacion.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_organizacion_params
      params.require(:rba_organizacion).permit(:estado, :nombre, :desc, :catfiscal_id, :idfiscal, :organizaciontipo_id, :empresagrupo_id, :domicilio)
    end
end
