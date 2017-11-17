class Valepdf < Prawn::Document

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


    self.formatted_text_box [ {text: 'VALE DE COMPRA',size: 12,styles: [:bold]}], :at =>[200,630], :width => 250, :height =>100 
    
    self.stroke_horizontal_line 140,375, :at => 615 

  end

  def body_content
    
    
    self.formatted_text_box [ {text: "Número de vale: " + @vale.numvale, size: 11,styles: [:bold]}], :at =>[20,600], :width => 250, :height =>100 
    
    self.formatted_text_box [ {text: "Número de propuesta: " + @vale.numprop, size: 11,styles: [:bold]}], :at =>[20,585], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Departamento: " + @vale.departamento, size: 11,styles: [:bold]}], :at =>[20,570], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "RC: " + @vale.rc.to_s, size: 11,styles: [:bold]}], :at =>[20,555], :width => 250, :height =>100     

    self.formatted_text_box [ {text: "Tercero: " + @vale.tercero, size: 11,styles: [:bold]}], :at =>[20,540], :width => 450, :height =>100     

    self.formatted_text_box [ {text: "Finalidad:", size: 11,styles: [:bold]}], :at =>[20,525], :width => 250, :height =>100   

    bounding_box( [20,510], :width => 400, :height => 50) do
      
      text @vale.finalidad      
    end

    self.formatted_text_box [ {text: "Objeto:", size: 11,styles: [:bold]}], :at =>[20,460], :width => 250, :height =>100   

    bounding_box( [20,445], :width => 400, :height => 150) do
      
      text @vale.objeto      
    end

    self.formatted_text_box [ {text: 'importe:' + @vale.importe.to_s ,size: 11,styles: [:bold]}], :at =>[20,295], :width => 250, :height =>100 

    self.formatted_text_box [ {text: "Retirado por:", size: 11,styles: [:bold]}], :at =>[20,250], :width => 250, :height =>100   

    self.formatted_text_box [ {text: "Alcalde - Presidente", size: 11,styles: [:bold]}], :at =>[300,250], :width => 250, :height =>100   

    self.formatted_text_box [ {text: "Manuel del Rosario Báez Guerra", size: 11,styles: [:bold]}], :at =>[300,235], :width => 250, :height =>100   
    
    
    
      end

end