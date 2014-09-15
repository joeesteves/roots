class Rad::OperaciontiposController < ApplicationController
  before_action :set_rad_operaciontipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rad/operaciontipos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rad/operaciontipos/1
  def show
  end

  # GET /rad/operaciontipos/new
  def new
    @rad_operaciontipo = Rad::Operaciontipo.new
    define_nodo(params[:nodo])
  end

  # GET /rad/operaciontipos/1/edit
  def edit
  end

  # POST /rad/operaciontipos
  def create
    @rad_operaciontipo = Rad::Operaciontipo.new(rad_operaciontipo_params)

    if @rad_operaciontipo.save
      redirect_to rad_operaciontipos_path, notice: 'Operaciontipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rad/operaciontipos/1
  def update
    if @rad_operaciontipo.update(rad_operaciontipo_params)
      flash[:nodo] = @rad_operaciontipo.nodos.first.id rescue nil
      redirect_to rad_operaciontipos_path, notice: 'Operaciontipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rad/operaciontipos/1
  def destroy
    @rad_operaciontipo.destroy
    redirect_to rad_operaciontipos_url, notice: 'Operaciontipo eliminado.'
  end

  def borrar_seleccion
    Rad::Operaciontipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rad_operaciontipo
      @rad_operaciontipo = Rad::Operaciontipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rad_operaciontipo_params
      params.require(:rad_operaciontipo).permit(:estado, :codigo, :nombre)
    end
end
