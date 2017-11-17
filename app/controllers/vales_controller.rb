class ValesController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :js

  def show
  	@vales = current_user.vouchers.page(params[:page])
      if params[:id].present?
          @vales = Voucher.page(params[:page])
      end    
  end

  def new
  	@vale = Voucher.new
  	@propuestas = current_user.proposals.where.not(numprop: Voucher.pluck(:numprop))
    
  end

  def create

    @vale = current_user.vouchers.new(param_vale)
    
    numero = Ecyear.find_by(:ejercicio => @vale.year);
    @vale.numvale = numero.orden_vale.to_s + "/" + @vale.year.to_s
    


    if @vale.save

        aux = numero.orden_vale + 1
        numero.update(:orden_vale => aux )

        redirect_to controller: "vales", action: "view_pdf", format: :pdf
    else
      render 'new'
    end
  end

  def destroy
    if Voucher.find(params[:id])
  	   @vale = Voucher.find(params[:id])
  	   @vale.destroy
  	   redirect_to controller: "vales", action: "show"
     end
  end

  def edit
  	@vale = Voucher.find(params[:id])
  end

  def update
  	@vales = Voucher.find(params[:id])

  	if @vales.update_attributes(param_vale)
    	redirect_to controller: "vales", action:"show"
  	else
    	render 'edit'
  	end
  end

  def view_pdf

  	if params[:id].present?
      @vale = Voucher.find(params[:id])
    else
      @vale = Voucher.last
    end
    
  respond_to do |format|
    	
      format.html
      format.pdf do
        pdf = Valepdf.new(@vale,view_context)
        send_data pdf.render, filename: 'vale.pdf', type: 'application/pdf'
      end
    end  

  end


def queries

    if params[:palabra].present?
      
          if current_user.rol == "ADMINISTRADOR"

              @vales = Voucher.where("numvale LIKE ?", params[:palabra])      

          else  
            
            @vales = current_user.vouchers.where("numvale LIKE ?", params[:palabra])      

          end  

      else if (params[:proveedor].present? && params[:concejalia].empty?)
        
           if current_user.rol == "ADMINISTRADOR"

              @vales = Voucher.where("tercero = ? and year = ?", params[:proveedor], params[:ejercicio])
              @suma = Voucher.where("tercero = ? and year = ?", params[:proveedor], params[:ejercicio]).select("SUM(vouchers.importe) AS total")
           
           else

              @vales = current_user.vouchers.where("tercero = ? and year = ?", params[:proveedor], params[:ejercicio])
              @suma = current_user.vouchers.where("tercero = ? and year = ?", params[:proveedor], params[:ejercicio]).select("SUM(vouchers.importe) AS total")

           end   



          else if (params[:concejalia].present? && params[:proveedor].empty?)

                  if current_user.rol == "ADMINISTRADOR"

                    @vales = Voucher.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio])      
                    @suma = Voucher.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio]).select("SUM(vouchers.importe) AS total")

                  else

                    @vales = current_user.vouchers.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio])      
                    @suma = current_user.vouchers.where("departamento = ? and year = ?", params[:concejalia], params[:ejercicio]).select("SUM(vouchers.importe) AS total")            

                  end  
              

                else if (params[:proveedor].present? && params[:concejalia].present?)

                      if current_user.rol == "ADMINISTRADOR"

                        @vales = Voucher.where("tercero = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio])      
                        @suma = Voucher.where("tercero = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio]).select("SUM(vouchers.importe) AS total")  

                      else
                        
                        @vales = current_user.vouchers.where("tercero = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio])      
                        @suma = current_user.vouchers.where("tercero = ? AND departamento = ? and year = ?", params[:proveedor], params[:concejalia], params[:ejercicio]).select("SUM(vouchers.importe) AS total")  
                      
                      end  

                  else
                  
                    if current_user.rol == "ADMINISTRADOR"

                        @vales = Voucher.where("year = ?", params[:ejercicio])      
                        @suma = Voucher.where("year = ?",  params[:ejercicio]).select("SUM(vouchers.importe) AS total")  

                      else
                        
                        @vales = current_user.vouchers.where("year = ?", params[:ejercicio])      
                        @suma = current_user.vouchers.where("year = ?", params[:ejercicio]).select("SUM(vouchers.importe) AS total")  
                      
                      end                      
                  #end    

                end    
          end
        end
    end    
  end



private
  def param_vale
    params.require(:vouchers).permit(:proposal_id,:numvale, :numprop, :year, :departamento,:rc, :tercero,:importe,:finalidad, :objeto) 
  end

end
