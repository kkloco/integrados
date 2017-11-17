class MainController < ApplicationController

  before_action :authenticate_user!

  def show
  	#@usuarios = User.all
    @usuarios = User.page(params[:page]).per(10)

  end

  def new
     @usuario = User.new
     @concejalias = Council.order("nombre")
  end

  def create

    
    @usuario = User.new(param_usuario)
    @usuario.concejalias = params[:concejalias] 
    
    if @usuario.save
      redirect_to :action => :show
    else
      render 'new'
    end
  end

  def edit
     @usuario = User.find(params[:id]) 
     @concejalias = Council.all
  end

  def destroy
    if User.find(params[:id])
  	   @usuario = User.find(params[:id])
  	   @usuario.destroy
  	   redirect_to controller: "main", action: "show"
     end
  end

  def update
    @usuario = User.find(params[:id])

    @usuario.concejalias = params[:concejalias] 

  	if @usuario.update_attributes(param_usuario_act)
    	redirect_to controller: "main", action:"show"
  	else
    	render 'edit'
  	end
  end

  def return_nombre
    nombre = User.select("nombre").where(:id => params[:id]);
    #Devuelve un json como salida al navegador.
    render :json => nombre[0]
    
  end

 private
  def param_usuario
    params.require(:users).permit(:email, 
                                 :password,
                                 :nombre, 
                                 :dni, 
                                 :cargo, 
                                 :rol, :concejalias )
  end

  def param_usuario_act
    params.require(:users).permit(:email, 
                                 :nombre, 
                                 :dni, 
                                 :cargo, 
                                 :rol, :concejalias )
  end

end
