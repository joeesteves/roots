class Rba::EmpresasController < ApplicationController
  before_action :set_rba_empresa, only: [:show, :edit, :update, :destroy]
  include Globales
  
  # GET /rba/empresas
  def index
    arbol_index(params[:nodo])  
  end

  # GET /rba/empresas/1
  def show
  end

  # GET /rba/empresas/new
  def new
    @rba_empresa = Rba::Empresa.new
    define_nodo(params[:nodo])
  end

  # GET /rba/empresas/1/edit
  def edit
  end

  def editar_multiples
    @rba_empresas = Rba::Empresa.find(params[:items].split(','))   
    respond_to do |format|
      format.html
    end 
  end 

  # POST /rba/empresas
  def create
    @rba_empresa = Rba::Empresa.new(rba_empresa_params)

    if @rba_empresa.save
      ubica_en_nodo
      redirect_to rba_empresas_path, notice: 'Empresa guardada'
    else

      render action: 'new'
    end
  end

  # PATCH/PUT /rba/empresas/1
  def update
    if @rba_empresa.update(rba_empresa_params)
      redirect_to rba_empresas_path, notice: 'Empresa actualizada.'
    else
      render action: 'edit'
    end
  end

  def actualizar_multiples
    @rba_empresas = Rba::Empresa.update(params[:rba_empresas].keys, params[:rba_empresas].values)
    @rba_empresas.reject! { |p| p.errors.empty? }
    if @rba_empresas.empty?
      redirect_to rba_empresas_url
    else
      render "editar_multiples"
    end

  end 

  # DELETE /rba/empresas/1
  def destroy
    @rba_empresa.destroy
    redirect_to rba_empresas_url, notice: 'Empresa eliminada'
  end

  def borrar_seleccion
    Rba::Empresa.destroy(params[:ids]) 
    render nothing: true  
  end
  

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_empresa
      @rba_empresa = Rba::Empresa.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_empresa_params
      params.require(:rba_empresa).permit(:codigo, :nombre, :catfiscal_id, :cuit, :empresagrupo_id)
    end
end
