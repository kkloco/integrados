class Reportpdf < Prawn::Document

  def initialize(propuesta,view)
    
    super()
    @propuesta = propuesta
    @vista = view
    header
    title_content
    body_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/logo.jpg", width: 190, height: 70
  end

  def title_content
    
   # y = cursor - 30


    self.formatted_text_box [ {text: 'ANEXO III - PROPUESTA DE GASTO',size: 12,styles: [:bold]}], :at =>[150,630], :width => 250, :height =>100 
    
    self.stroke_horizontal_line 140,375, :at => 615 

  end

  def body_content
    
    
    self.formatted_text_box [ {text: "Número de propuesta: " + @propuesta.numprop, size: 11,styles: [:bold]}], :at =>[20,600], :width => 250, :height =>100 
    
    self.formatted_text_box [ {text: "Proyecto: " + @propuesta.proyecto, size: 11,styles: [:bold]}], :at =>[20,585], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Departamento: " + @propuesta.departamento, size: 11,styles: [:bold]}], :at =>[20,570], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Partida presup.: " + @propuesta.partida, size: 11,styles: [:bold]}], :at =>[20,555], :width => 250, :height =>100         

    self.formatted_text_box [ {text: "RC: " + @propuesta.rc.to_s, size: 11,styles: [:bold]}], :at =>[20,540], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Tercero: " + @propuesta.tercero, size: 11,styles: [:bold]}], :at =>[20,525], :width => 450, :height =>100     

    self.formatted_text_box [ {text: "CIF: " + @propuesta.cif, size: 11,styles: [:bold]}], :at =>[20,510], :width => 250, :height =>100         

    self.formatted_text_box [ {text: "Contrato: " + @propuesta.contrato, size: 11,styles: [:bold]}], :at =>[20,495], :width => 250, :height =>100  

    self.formatted_text_box [ {text: "Acuerdos: " + @propuesta.acuerdos, size: 11,styles: [:bold]}], :at =>[20,480], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Otros: " + @propuesta.otros, size: 11,styles: [:bold]}], :at =>[20,465], :width => 250, :height =>100   

    self.formatted_text_box [ {text: "Finalidad:", size: 11,styles: [:bold]}], :at =>[20,450], :width => 250, :height =>100   

    bounding_box( [20,435], :width => 400, :height => 50) do
      
      text @propuesta.finalidad      
    end

    self.formatted_text_box [ {text: "Objeto:", size: 11,styles: [:bold]}], :at =>[20,375], :width => 250, :height =>100   

    bounding_box( [20,360], :width => 400, :height => 100) do
      
      text @propuesta.objeto      
    end


    self.formatted_text_box [ {text: "Empleado responsable:", size: 11,styles: [:bold]}], :at =>[20,245], :width => 250, :height =>100   

    bounding_box( [20,230], :width => 400, :height => 100) do
      
      text @propuesta.empleado_firma      
    end

    self.formatted_text_box [ {text: "Político responsable:", size: 11,styles: [:bold]}], :at =>[300,245], :width => 250, :height =>100   

    bounding_box( [300,230], :width => 400, :height => 100) do
      
      text @propuesta.politico_firma      
    end
    
    self.formatted_text_box [ {text: 'Observaciones',size: 11,styles: [:bold]}], :at =>[20,115], :width => 250, :height =>100 
    
    self.stroke_horizontal_line 20,500, :at => 105 

    bounding_box( [20,100], :width => 500, :height => 100) do
      text "1. La gestión del gasto se asustará al procedimiento administrativo establecido en la normativa vigente.\n" +
           "2. La ejecución del presupuesto de gasto exigirá tramitación del correspondiente expediente de gasto, de acuerdo a la base 26.\n" +
           "3. A esta propuesta deberá acompañar el informe acreditativo de la necesidad, conveniencia y oportunidad de la realización del gasto."
    end
  end

 
end