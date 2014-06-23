class Rba::ArbolesController < ApplicationController
  before_action :set_rba_arbol, only: [:show, :edit, :update, :destroy]
  include Globales
  # GET /rba/arboles
  def index
    arbol_index(params[:nodo])
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

    
    begin
      @rba_arbol.save
      clase = @rba_arbol.modelo.classify.constantize
      metodo = @rba_arbol.modelo.gsub('/','_') 
      raiz = @rba_arbol.nodos.create(:nombre => @rba_arbol.nombre)
      raiz.update_attributes(metodo.to_sym => clase.all )
      redirect_to rba_arboles_path, notice: 'Arbol guardado'

    rescue  Exception 
      @rba_arbol.destroy
      # redirect_to new_rba_arbol_path, notice: "Revise el nombre del modelo"
      flash[:notice] = 'Error: el modelo debe tener este formato
      namespace/nombre del modelo. Incluir el modelo en el metodo 
      habmt de la clase nodo. Nombre y modelo no pueden repetirse'
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
    Rba::Arbol.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_arbol
      @rba_arbol = Rba::Arbol.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_arbol_params
      params.require(:rba_arbol).permit(:nombre, :modelo)
    end
end
