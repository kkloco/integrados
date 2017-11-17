class RelacionesController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :js

  def show
  	@grupos = Join.page(params[:page])
  end
  
  def new
  	@grupo = Join.new
  end

  def create
    @grupo = Join.new(param_grupos)
    
    if @grupo.save
        redirect_to :action => :show
    end
  end

  
  def destroy
    if Join.find(params[:id])
  	   @grupo = Join.find(params[:id])
  	   @grupo.destroy
  	   redirect_to controller: "relaciones", action: "show"
     end
  end


  private
  def param_grupos
      params.require(:joins).permit(:id_us,:nombre_usuario,:id_conc,:nombre_concejalia) 
  end


end
