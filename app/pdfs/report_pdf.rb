class ReportPdf < Prawn::Document

  def initialize(invoce)
    super()
    @invoce = invoce
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

      bounding_box([gap, cursor - gap], :width => 350, :height => 320) do
        text "PACKING LIST CORRESPONDIENTE A FRA. MAD-#{@invoce.invocedate.strftime("%d%m%Y")}/#{@invoce.shop}\n\n\n", :size => 10
        text "TIENDA:\n\n", :size => 10
        text "OYSHO #{@invoce.shop}\n", :font => :bold, style: :bold
        text "ITX MERKEN BV.FRIBOURG BRANCH\n", :size => 10, style: :bold
        text "#{@invoce.address}\n", :size => 10, style: :bold
        text "#{@invoce.city}\n\n\n",:size => 10, style: :bold

        text "CARACTERISTICAS DEL EQUIPO:\n\n",:size => 10
        text "Equipo DVD reproductor digital de música\n", :size => 10, style: :bold

        move_down 20

        t = make_table([["Nº Bultos", "1"],
                ["Peso", "4Kgs"],
                ["Peso Neto", "3.75 Kgs"],
                ["Medidas", "27,5 X 29,5 X 6,5"],
                ["Partida Arancelaria", "8521901000"]],:cell_style => {:border_color => "FFFFCC",:padding => [0, 0, 0, 35]})

        t.draw

      end

    end

  end

end