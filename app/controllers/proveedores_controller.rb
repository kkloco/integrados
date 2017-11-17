class ProveedoresController < ApplicationController

	before_action :authenticate_user!

  def show
  	   @filtro = params[:filtro]
       @filtroR = params[:filtroR]
      if @filtro
        @proveedores = Provider.where(:CIF => @filtro).page(params[:page])
        render 'show'
        else if @filtroR
          @proveedores = Provider.where(:razon_social => @filtroR).page(params[:page])
          render 'show'
        else if @filtro & @filtroR 
          @proveedores = Provider.where(["CIF = ? and razon_social like ?", @filtro, @filtroR ]).page(params[:page])
          render 'show'
        else
          @proveedores = Provider.page(params[:page])
          render 'show'
        end
      end
    end
  end

  def show_all
    @proveedores = Provider.all.page(params[:page]).per(10000)
    proveedores = Provider.all
    render :json => proveedores[0]
    render 'show'
  end

  def new
  	@proveedor = Provider.new
  end

  def edit
    @proveedor = Provider.find(params[:id])
  end

  def update
    @proveedor = Provider.find(params[:id])

    if @proveedor.update_attributes(param_proveedor)
      redirect_to controller: "proveedores", action:"show"
    else
      render 'edit'
    end
  end


  def create
    @proveedor = Provider.new(param_proveedor)

    if @proveedor.save
      flash[:notice] = 'Proveedor creado correctamente'
      redirect_to :action => :show
    else
      render 'new'
    end
  end

 def destroy
	    if Provider.find(params[:id])
	  	   @proveedor = Provider.find(params[:id])
	  	   @proveedor.destroy
	  	   redirect_to controller: "proveedores", action: "show"
	     end
	  end

  def return_nombre
    nombre = Provider.select("razon_social, cif").where(:id => params[:id]);
    #Devuelve un json como salida al navegador.
    render :json => nombre[0]
    
  end    

private
  def param_proveedor
    params.require(:providers).permit(:CIF,:razon_social,:contacto,:direccion,:poblacion,:cod_postal,:provincia,:tlf1,:tlf2,:fax,:web,:email,:tope_gasto)
  end

end
