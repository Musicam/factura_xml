class ProformaPdf < Prawn::Document

  def initialize(invoce)
    super()
    @invoce = invoce
    #header
    text_content

  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  def box_content(string)
    text string
    transparent(0.5) { stroke_bounds }
  end

  def text_content

    gap = 20
    bounding_box([50, cursor], :width => 400, :height => 650) do

      bounding_box([gap, cursor - gap], :width => 350, :height => 80) do
        image "#{Rails.root}/public/logo.png",:width => 150, :height => 80
      end
      bounding_box([gap+200, cursor - gap], :width => 150, :height => 80) do
        text "#{@invoce.invoced_company.name}", :size => 9
        text "#{@invoce.invoced_company.address}", :size => 9
        text "#{@invoce.invoced_company.city_cp}", :size => 9
        text "#{@invoce.invoced_company.country}", :size => 9
        text "Tel: #{@invoce.invoced_company.phone}", :size => 9
      end

      bounding_box([gap, cursor - gap], :width => 400, :height => 400) do

      move_down 20
      country = "Madrid"
      

      t = make_table([["Madrid 4 de Septiembre 2014"," ", " ","Fra PROFORMA #{@invoce.invocedate.strftime("%d%m%Y")}/#{@invoce.shop}"]], :cell_style => {:size => 8,:padding => [0, 0, 0, 35],:border_color => "FFFFCC"},:width => 400)
      t.draw
      move_down 20
      t2 = make_table([["Cantidad","Descripcion", "P.Unitario","TOTAL"],["1","Importe correspondiente a la venta del
material que a continuación detallamos
para el siguiente cliente.

Equipo DVD reproductor digital de
música. Peso: 4 Kg. Medidas: 27,5x29,5
x6,5 cm. País de origen: ESPAÑA
OYSHO #{@invoce.shop}

ITX MERKEN BV.FRIBOURG BRANCH
#{@invoce.address}
#{@invoce.city}
Partida Arancelaria 8521901000","5 euros","5 euros"],
                       [{:content => "",:colspan => 2}, "Subtotal","5 euros"],
                       [{:content => "",:colspan => 2}, "IVA "," "],
                       [{:content => "",:colspan => 2}, "TOTAL","5 euros"]],:cell_style => {:size => 8,:padding => [10, 0, 10, 10]},:width => 400,:column_widths => [50, 250, 50, 50])
      t2.draw

      end

      move_down 20

      text "MARIE CURIE, 5-7 EDIF. BETA 2º PLTA - 28521 RIVAS VACIAMADRID-MADRID CIF: A-08204638", {:align => :right, :size => 8}

    end

  end

end
