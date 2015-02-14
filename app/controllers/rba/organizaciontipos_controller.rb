class Rba::OrganizaciontiposController < ApplicationController
  before_action :set_rba_organizaciontipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/organizaciontipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rba/organizaciontipos/1
  def show
  end

  # GET /rba/organizaciontipos/new
  def new
    @rba_organizaciontipo = Rba::Organizaciontipo.new
    define_nodo(params[:nodo])
  end

  # GET /rba/organizaciontipos/1/edit
  def edit
  end

  # POST /rba/organizaciontipos
  def create
    @rba_organizaciontipo = Rba::Organizaciontipo.new(rba_organizaciontipo_params)

    if @rba_organizaciontipo.save
      redirect_to rba_organizaciontipos_path, notice: 'Organizaciontipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/organizaciontipos/1
  def update
    if @rba_organizaciontipo.update(rba_organizaciontipo_params)
      flash[:nodo] = @rba_organizaciontipo.nodos.first.id rescue nil
      redirect_to rba_organizaciontipos_path, notice: 'Organizaciontipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/organizaciontipos/1
  def destroy
    @rba_organizaciontipo.destroy
    redirect_to rba_organizaciontipos_url, notice: 'Organizaciontipo eliminado.'
  end

  def borrar_seleccion
    Rba::Organizaciontipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_organizaciontipo
      @rba_organizaciontipo = Rba::Organizaciontipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_organizaciontipo_params
      params.require(:rba_organizaciontipo).permit(:nombre, :estado, :desc)
    end
end
