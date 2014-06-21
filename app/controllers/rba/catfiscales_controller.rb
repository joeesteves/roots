class Rba::CatfiscalesController < ApplicationController
  before_action :set_rba_catfiscal, only: [:show, :edit, :update, :destroy]

  # GET /rba/catfiscales
  def index
    @rba_catfiscales = Rba::Catfiscal.all
  end

  # GET /rba/catfiscales/1
  def show
  end

  # GET /rba/catfiscales/new
  def new
    @rba_catfiscal = Rba::Catfiscal.new
  end

  # GET /rba/catfiscales/1/edit
  def edit
  end

  # POST /rba/catfiscales
  def create
    @rba_catfiscal = Rba::Catfiscal.new(rba_catfiscal_params)

    if @rba_catfiscal.save
      redirect_to rba_catfiscales_path, notice: 'Catfiscal guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/catfiscales/1
  def update
    if @rba_catfiscal.update(rba_catfiscal_params)
      redirect_to rba_catfiscales_path, notice: 'Catfiscal actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/catfiscales/1
  def destroy
    @rba_catfiscal.destroy
    redirect_to rba_catfiscales_url, notice: 'Catfiscal eliminado.'
  end

  def borrar_seleccion
    Rba::Catfiscal.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_catfiscal
      @rba_catfiscal = Rba::Catfiscal.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_catfiscal_params
      params.require(:rba_catfiscal).permit(:codigo, :nombre, :desc)
    end
end
