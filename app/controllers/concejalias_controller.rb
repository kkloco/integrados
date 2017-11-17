class ConcejaliasController < ApplicationController

	before_action :authenticate_user!

  def show
  	@concejalias = Council.page(params[:page]).per(10)
  end

  def new
  	@concejalia = Council.new
  end

  def create
    @concejalia = Council.new(param_concejalia)

    if @concejalia.save
      flash[:notice] = 'Concejalía creada correctamente'
      redirect_to :action => :show
    else
      render 'new'
    end
  end

 def destroy
    if Council.find(params[:id])
  	   @concejalia = Council.find(params[:id])
  	   @concejalia.destroy
  	   redirect_to controller: "concejalias", action: "show"
     end
  end

  def edit
  	@concejalia = Council.find(params[:id])
  end

  def update
  	@concejalia = Council.find(params[:id])

  	if @concejalia.update_attributes(param_concejalia)
    	redirect_to controller: "concejalias", action:"show"
  	else
    	render 'edit'
  	end
  end

  def return_nombre
    nombre = Council.select("responsable, nombre").where(:id => params[:id]);
    #Devuelve un json como salida al navegador.
    render :json => nombre[0]    
  end



  private
  def param_concejalia
    params.require(:councils).permit(:nombre, 
                                 :responsable,
                                 :id_responsable)
  end

end
