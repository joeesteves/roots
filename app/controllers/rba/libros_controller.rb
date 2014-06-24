class Rba::LibrosController < ApplicationController
  before_action :set_rba_libro, only: [:show, :edit, :update, :destroy]
  include Globales

  # GET /rba/libros
  def index
    arbol_index(params[:nodo])
  end

  # GET /rba/libros/1
  def show
  end

  # GET /rba/libros/new
  def new
    @rba_libro = Rba::Libro.new
    define_nodo(params[:nodo])
  end

  # GET /rba/libros/1/edit
  def edit
  end

  # POST /rba/libros
  def create
    @rba_libro = Rba::Libro.new(rba_libro_params)

    if @rba_libro.save
      redirect_to rba_libros_path, notice: 'Libro guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/libros/1
  def update
    if @rba_libro.update(rba_libro_params)
      redirect_to rba_libros_path, notice: 'Libro actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/libros/1
  def destroy
    @rba_libro.destroy
    redirect_to rba_libros_url, notice: 'Libro eliminado.'
  end

  def borrar_seleccion
    Rba::Libro.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_libro
      @rba_libro = Rba::Libro.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_libro_params
      params.require(:rba_libro).permit(:nombre, :autor, :categoria, :editorial)
    end
end
