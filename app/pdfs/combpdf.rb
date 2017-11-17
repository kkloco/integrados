class Combpdf < Prawn::Document

  def initialize(vale,view)
    
    super()
    @vale = vale
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


    self.formatted_text_box [ {text: 'VALE DE COMBUSTIBLE',size: 12,styles: [:bold]}], :at =>[200,630], :width => 250, :height =>100 
    
    self.stroke_horizontal_line 140,375, :at => 615 

  end

  def body_content
    
    
    self.formatted_text_box [ {text: "Número de vale: " + @vale.numcomb, size: 11,styles: [:bold]}], :at =>[20,600], :width => 250, :height =>100 

    #self.formatted_text_box [ {text: "Fecha: " + @vale.created_at.to_s, size: 11,styles: [:bold]}], :at =>[20,585], :width => 250, :height =>100     
    
    self.formatted_text_box [ {text: "Matricula: " + @vale.matricula, size: 11,styles: [:bold]}], :at =>[20,575], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Departamento: " + @vale.departamento, size: 11,styles: [:bold]}], :at =>[20,550], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Proveedor: " + @vale.proveedor, size: 11,styles: [:bold]}], :at =>[20,525], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Concepto: " + @vale.concepto, size: 11,styles: [:bold]}], :at =>[20,500], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Importe: " + @vale.importe.to_s, size: 11,styles: [:bold]}], :at =>[20,475], :width => 450, :height =>100     

        
      end

end