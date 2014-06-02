class HolasController < ApplicationController
  before_action :set_hola, only: [:show, :edit, :update, :destroy]

  # GET /holas
  def index
    @holas = Hola.all
  end

  # GET /holas/1
  def show
  end

  # GET /holas/new
  def new
    @hola = Hola.new
  end

  # GET /holas/1/edit
  def edit
  end

  # POST /holas
  def create
    @hola = Hola.new(hola_params)

    if @hola.save
      redirect_to holas_path, notice: 'Hola guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /holas/1
  def update
    if @hola.update(hola_params)
      redirect_to holas_path, notice: 'Hola actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /holas/1
  def destroy
    @hola.destroy
    redirect_to holas_url, notice: 'Hola eliminado.'
  end
  def delete_selection
    Hola.delete(params[:ids])
    render nothing: true  
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hola
      @hola = Hola.find(params[:id])
    end

  

    # Only allow a trusted parameter "white list" through.
    def hola_params
      params.require(:hola).permit(:nombre, :apellido)
    end
end
