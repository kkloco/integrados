class VehiculosController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :js
  
	def show
		@coches = Car.page(params[:page])
	end

	def new
		@coche = Car.new
	end

	def create
		@coche = Car.new(param_coche)
	    
	    if @coche.save
	        redirect_to controller: "vehiculos", action: "show"
	    else
	      render 'new'
	    end
	end

	def edit
		@coche = Car.find(params[:matricula])
	end

	def update

		@coches = Car.find(params[:matricula])

	  	if @coches.update_attributes(param_coche)
	    	redirect_to controller: "vehiculos", action:"show"
	  	else
	    	render 'edit'
	  	end
	end

	def destroy

		 if Car.find(params[:matricula])
	  	   @coche = Car.find(params[:matricula])
	  	   @coche.destroy
	  	   redirect_to controller: "vehiculos", action: "show"
	     end	

	end

	def view_pdf
	end

private
  def param_coche
    params.require(:cars).permit(:matricula,:conductor, :localizacion, :finalidad) 
  end

end
