class ContablesController < ApplicationController
	before_action :authenticate_user!

  def show
  	#@usuarios = User.all
    @contables = Ecyear.page(params[:page]).per(10)
  end

  def new
     @contable = Ecyear.new
  end

  def create
    @contable = Ecyear.new(param_contable)

    if @contable.save
      redirect_to :action => :show
    else
      render 'new'
    end
  end

  def edit
     @contable = Ecyear.find(params[:id]) 
  end

  def destroy
    if Ecyear.find(params[:id])
  	   @contable = Ecyear.find(params[:id])
  	   @contable.destroy
  	   redirect_to controller: "contables", action: "show"
     end
  end

  def update
    @contable = Ecyear.find(params[:id])

  	if @contable.update_attributes(param_contable)
    	redirect_to controller: "contables", action:"show"
  	else
    	render 'edit'
  	end
  end

  def return_orden
    
    
    #    numero = Ecyear.select("orden").where(:ejercicio => params[:ejercicio])
        #actualizamos la tabla ejercicios sumando uno
          
    #      datos = Ecyear.find_by(:ejercicio => params[:ejercicio])
    #      aux = datos.orden + 1
    #      datos.update(:orden => aux )

    #      puts aux
          
        #Devuelve un json como salida al navegador.
    #    render :json => numero[0]
        
  end

 private
  def param_contable
    params.require(:ecyears).permit(:ejercicio, 
                                 :orden,:orden_vale,:orden_combustible,
                                 :activo)
  end

  
end
