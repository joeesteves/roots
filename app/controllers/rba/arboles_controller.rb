class Rba::ArbolesController < ApplicationController
  before_action :set_rba_arbol, only: [:show, :edit, :update, :destroy]

  # GET /rba/arboles
  def index
    @rba_arboles = Rba::Arbol.all
  end

  # GET /rba/arboles/1
  def show
  end

  # GET /rba/arboles/new
  def new
    @rba_arbol = Rba::Arbol.new
  end

  # GET /rba/arboles/1/edit
  def edit
  end

  # POST /rba/arboles
  def create
    @rba_arbol = Rba::Arbol.new(rba_arbol_params)

    if @rba_arbol.save
      redirect_to rba_arboles_path, notice: 'Arbol guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/arboles/1
  def update
    if @rba_arbol.update(rba_arbol_params)
      redirect_to rba_arboles_path, notice: 'Arbol actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/arboles/1
  def destroy
    @rba_arbol.destroy
    redirect_to rba_arboles_url, notice: 'Arbol eliminado.'
  end

  def borrar_seleccion
    Rba::Arbol.delete(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_arbol
      @rba_arbol = Rba::Arbol.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_arbol_params
      params.require(:rba_arbol).permit(:nombre, :model_id)
    end
end
