class PropuestasController < ApplicationController

	before_action :authenticate_user!
  respond_to :html, :js

  def show
  	@propuestas = current_user.proposals.page(params[:page])
      if params[:id].present?
          @propuestas = Proposal.page(params[:page])
      end    
  end
  
  def new
  	@propuesta = Proposal.new
    
  end

  def create
    @propuesta = current_user.proposals.new(param_propuesta)
    
    numero = Ecyear.find_by(:ejercicio => @propuesta.year);
    @propuesta.numprop = numero.orden.to_s + "/" + @propuesta.year.to_s



    if @propuesta.save

        aux = numero.orden + 1
        numero.update(:orden => aux )
        #numero.save
        #puts aux

        respond_to do |format|
            format.html
            format.json
            #format.pdf { render template: 'propuestas/propuesta', pdf:'Propuesta' }
            #redirect_to controller: "propuestas", action: "propuesta", format: :pdf
            redirect_to controller: "propuestas", action: "view_pdf", format: :pdf
        end
    else
      render 'new'
    end
  end

  def propuesta

    @propuesta = current_user.proposals.last

    respond_to do |format|
            
            format.pdf { render template: 'propuestas/propuesta', pdf:'propuesta' }
            
        end

  end

 def propuesta_id

    @propuesta = @propuesta = Proposal.find(params[:id])

    respond_to do |format|
            
            format.pdf { render template: 'propuestas/propuesta', pdf:'propuesta' }
            
        end

  end

  def queries

    if params[:palabra].present?
      
          if current_user.rol == "ADMINISTRADOR"

              @propuestas = Proposal.where("numprop LIKE ?", params[:palabra])      

          else  
            
            @propuestas = current_user.proposals.where("numprop LIKE ?", params[:palabra])      

          end  

      else if (params[:proveedor].present? && params[:concejalia].empty?)
        
           if current_user.rol == "ADMINISTRADOR"

              @propuestas = Proposal.where("ter_id = ? and year = ?", params[:proveedor], params[:ejercicio])
              @suma = Proposal.where("ter_id = ? and year = ?", params[:proveedor], params[:ejercicio]).select("SUM(proposals.importe) AS total")
           
           else

              @propuestas = current_user.proposals.where("ter_id = ? and year = ?", params[:proveedor], params[:ejercicio])
              @suma = current_user.proposals.where("ter_id = ? and year = ?", params[:proveedor], params[:ejercicio]).select("SUM(proposals.importe) AS total")

           end   



          else if (params[:concejalia].present? && params[:proveedor].empty?)

                  if current_user.rol == "ADMINISTRADOR"

                    @propuestas = Proposal.where("dep_id = ? and year = ?", params[:concejalia], params[:ejercicio])      
                    @suma = Proposal.where("dep_id = ? and year = ?", params[:concejalia], params[:ejercicio]).select("SUM(proposals.importe) AS total")

                  else

                    @propuestas = current_user.proposals.where("dep_id = ? and year = ?", params[:concejalia], params[:ejercicio])      
                    @suma = current_user.proposals.where("dep_id = ? and year = ?", params[:concejalia], params[:ejercicio]).select("SUM(proposals.importe) AS total")            

                  end  
              

                else if (params[:proveedor].present? && params[:concejalia].present?)

                      if current_user.rol == "ADMINISTRADOR"

                        @propuestas = Proposal.where("ter_id = ? AND dep_id = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio])      
                        @suma = Proposal.where("ter_id = ? AND dep_id = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio]).select("SUM(proposals.importe) AS total")  

                      else
                        
                        @propuestas = current_user.proposals.where("ter_id = ? AND dep_id = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio])      
                        @suma = current_user.proposals.where("ter_id = ? AND dep_id = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio]).select("SUM(proposals.importe) AS total")  
                      
                      end  

                  else
                  
                    if current_user.rol == "ADMINISTRADOR"

                        @propuestas = Proposal.where("year = ?", params[:ejercicio])      
                        @suma = Proposal.where("year = ?",  params[:ejercicio]).select("SUM(proposals.importe) AS total")  

                      else
                        
                        @propuestas = current_user.proposals.where("year = ?", params[:ejercicio])      
                        @suma = current_user.proposals.where("year = ?", params[:ejercicio]).select("SUM(proposals.importe) AS total")  
                      
                      end                      
                  #end    

                end    
          end
        end
    end    
  end

  def search
    
   
  end


  def destroy
    if Proposal.find(params[:id])
  	   @propuesta = Proposal.find(params[:id])
  	   @propuesta.destroy
  	   redirect_to controller: "propuestas", action: "show"
     end
  end

  def edit
  	@propuesta = Proposal.find(params[:id])
  end

  def update
  	@propuesta = Proposal.find(params[:id])

  	if @propuesta.update_attributes(param_propuesta)
    	redirect_to controller: "propuestas", action:"show"
  	else
    	render 'edit'
  	end
  end

  def view_pdf

    if params[:id].present?
      @propuesta = Proposal.find(params[:id])
    else
      @propuesta = Proposal.last
    end
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Reportpdf.new(@propuesta,view_context)
        send_data pdf.render, filename: 'propuesta.pdf', type: 'application/pdf'
      end
    end

  end


  def return_datos_vale

    #datos = Proposal.select("tercero,departamento").where(:id => params[:id]);
    datos = Proposal.where(:id => params[:id]);
    #Devuelve un json como salida al navegador.
    render :json => datos[0]
    
  end

  private
  def param_propuesta
    params.require(:proposals).permit(:proyecto,:year, :numprop, :departamento,:partida, :rc, :tercero, :cif, :importe, :dep_id,
      :ter_id, :contrato, :acuerdos, :otros, :finalidad, :objeto, :empleado_firma, :politico_firma) 
  end
end
