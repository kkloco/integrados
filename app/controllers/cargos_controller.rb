class CargosController < ApplicationController

  before_action :authenticate_user!

  def show
  	#@cargos = Position.all
     @cargos = Position.page(params[:page]).per(10)
  end

  def new
  	@position = Position.new
  end

  def create
    @position = Position.new(param_cargo)

    if @position.save
      redirect_to :action => :show
    else
      render 'new'
    end
  end

  def destroy
    if Position.find(params[:id])
  	   @cargo = Position.find(params[:id])
  	   @cargo.destroy
  	   redirect_to controller: "cargos", action: "show"
     end
  end

  def edit
  	@cargo = Position.find(params[:id])
  end

  def update
    @cargo = Position.find(params[:id])

  	if @cargo.update_attributes(param_cargo)
    	redirect_to controller: "cargos", action:"show"
  	else
    	render 'edit'
  	end
  end

  private
  def param_cargo
    params.require(:positions).permit(:nombre)
  end
end
