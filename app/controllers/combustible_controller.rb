class CombustibleController < ApplicationController
  
  before_action :authenticate_user!
  respond_to :html, :js

  def show
  	@vales_comb = current_user.gas.page(params[:page])
      if params[:id].present?
          @vales_comb = Ga.page(params[:page])
      end    	
  end

  def new
  	@vale = Ga.new
  end

  def create
    @vale = current_user.gas.new(param_gas)
    
    numero = Ecyear.find_by(:ejercicio => @vale.year);
    @vale.numcomb = numero.orden_combustible.to_s + "/" + @vale.year.to_s



    if @vale.save

        aux = numero.orden_combustible + 1
        numero.update(:orden_combustible => aux )
        redirect_to controller: "combustible", action: "view_pdf", format: :pdf
        
    else
      render 'new'
    end
  end

  def edit
  	@vale = Ga.find(params[:numcomb])
  end

  def update
  	@vale = Ga.find(params[:numcomb])

  	if @vale.update_attributes(param_gas)
    	redirect_to controller: "combustible", action:"show"
  	else
    	render 'edit'
  	end
  end


  def destroy
    if Ga.find(params[:numcomb])
  	   @vale = Ga.find(params[:numcomb])
  	   @vale.destroy
  	   redirect_to controller: "combustible", action: "show"
     end
  end

  def view_pdf

	  	if params[:numcomb].present?
	      @vale = Ga.find(params[:numcomb])
	    else
	      @vale = Ga.last
	    end
	    
	  	respond_to do |format|
	    	
	      format.html
		  format.pdf do
		        pdf = Combpdf.new(@vale,view_context)
		        send_data pdf.render, filename: 'combustible.pdf', type: 'application/pdf'
		    end
	    end  

  end


  def queries

    if params[:palabra].present?
              
             @vales = Ga.where("numcomb LIKE ?", params[:palabra])      

      else if (params[:proveedor].present? && params[:concejalia].empty? &&  params[:matricula].empty?)
        
              @vales = Ga.where("proveedor = ? and year = ?", params[:proveedor], params[:ejercicio])
              @suma = Ga.where("proveedor = ? and year = ?", params[:proveedor], params[:ejercicio]).select("SUM(gas.importe) AS total")

          else if (params[:concejalia].present? && params[:proveedor].empty? && params[:matricula].empty?)

                    @vales = Ga.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio])      
                    @suma = Ga.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio]).select("SUM(gas.importe) AS total")


                else if (params[:proveedor].present? && params[:concejalia].present? && params[:matricula].empty?)

                        @vales = Ga.where("proveedor = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio])      
                        @suma = Ga.where("proveedor = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio]).select("SUM(gas.importe) AS total")  

                      else if (params[:matricula].present? && params[:proveedor].empty? && params[:concejalia].empty?)

	                        @vales = Ga.where("matricula = ? and year = ?", params[:matricula], params[:ejercicio])      
	                        @suma = Ga.where("matricula = ?  and year = ?", params[:matricula], params[:ejercicio]).select("SUM(gas.importe) AS total")  

	                    else if (params[:proveedor].present? && params[:concejalia].empty? && params[:matricula].present?)

	                        @vales = Ga.where("matricula = ? and proveedor = ? and year = ?", params[:matricula], params[:proveedor], params[:ejercicio])      
	                        @suma = Ga.where("matricula = ?  and proveedor = ? and year = ?", params[:matricula], params[:proveedor], params[:ejercicio]).select("SUM(gas.importe) AS total")  

	                    	else if (params[:matricula].present? && params[:proveedor].empty? && params[:concejalia].present?)

	                        	@vales = Ga.where("matricula = ? and departamento = ? and year = ?", params[:matricula], params[:concejalia], params[:ejercicio])      
	                        	@suma = Ga.where("matricula = ?  and departamento = ? and year = ?", params[:matricula], params[:concejalia], params[:ejercicio]).select("SUM(gas.importe) AS total")  

                    	
                    		else
                  
                   		         @vales = Ga.where("year = ?", params[:ejercicio])      
                        		 @suma = Ga.where("year = ?",  params[:ejercicio]).select("SUM(gas.importe) AS total")  

                			end
                		end	    
          			end
          		end	
        	end
    	end    
  	end
 end
 
  private
  def param_gas
    params.require(:gas).permit(:year, :numcomb, :proveedor,:matricula, :concepto, :importe, :id_prov, :departamento, :dep_id) 
  end
end
