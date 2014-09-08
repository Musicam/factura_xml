class Invoce < ActiveRecord::Base

  before_save :create_xml, :create_pdf_packing, :create_pdf_proforma
  after_destroy :destroy_xml, :destroy_pdf_packing, :destroy_pdf_proforma

  belongs_to :invoced_company
  belongs_to :order_type
  validates_presence_of :invoced_company_id
  validates_presence_of :order_type_id
  validates_presence_of :shop
  validates_presence_of :quantity
  validates_presence_of :invocedate
  validates_presence_of :address
  validates_presence_of :city

  def get_xml_url
    return "#{Rails.root}/public/xml/#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.xml"
  end

  def get_pdf_packing
    return "#{Rails.root}/public/pdf/packing/#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.pdf"
  end

  def get_pdf_proforma
    return "#{Rails.root}/public/pdf/proforma/#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.pdf"
  end

  def get_xml_file_name
    return "#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.xml"
  end

  def get_pdf_packing_file_name
    return "#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.pdf"
  end

  def get_pdf_proforma_file_name
    return "#{self.invocedate.strftime("%d%m%Y")}_#{self.shop}.pdf"
  end

  def create_pdf_packing()
    url = get_pdf_packing
    pdf = ReportPdf.new(self)
    pdf.render_file(File.open(url, 'w'))
  end

  def create_pdf_proforma()
    url = get_pdf_proforma
    pdf = ProformaPdf.new(self)
    pdf.render_file(File.open(url, 'w'))
  end

  def create_xml()
    url = get_xml_url
    my_hash = { :header =>
                  {:SupplierMerkenID => 10078,
                   :SupplierName =>    "RADIO AMBIENTE MUSICAL S.A.",
                   :SupplierAddress => "MARIE CURIE, 5-7 EDIF. BETA 2, 2-1 - 28521 RIVAS VACIAMADRID-MADRID-SPAIN",
                   :SupplierNIF => "A-08204638",
                   :InvoiceNumber => "MAD-#{self.invocedate.strftime("%d%m%Y")}/#{self.shop}",
                   :InvoiceDate => "#{self.invocedate.strftime("%d/%m/%Y")}",
                   :InvoicedCompany => "#{self.invoced_company.name}",
                   :BaseAmount => "",
                   :RecyclingAmount => "",
                   :VATPercentage => "",
                   :VATAmount => "",
                   :DiscountPercentage => "",
                   :DiscountAmount => "",
                   :TotalAmount => "",
                   :Currency => "EURO",
                   :Bundles     =>"#{self.quantity}",
                   :NetWeight   =>"3,75",
                   :GrossWeight =>"4",
                   :Comments => "-",
                   :InvoiceType =>"PROFORMA"
                  },
                :LogisticInfo =>
                  {:Incoterm =>"",
                   :FleteAmount =>"",
                   :DestinationPort =>""},
                :DepartmentInfo =>
                  {:OriginCompany =>"",
                   :OriginDepartment => "",
                   :PersonContact =>""},
                :lines =>
                  {:line =>
                    {:DestinationShopID =>"#{self.shop}",
                     :ItemCode =>"",
                     :SpanishDescription =>"Equipo DVD reproductor digital de musica",
                     :EnglishDescription =>"DVD player",
                     :Price =>"5",
                     :LineAmount =>"",
                     :LineVATAmount =>"",
                     :UnitVATPercentage =>"",
                     :UnitMeasure =>"cm",
                     :RealMeasure =>"27,5x29,5x6,5",
                     :Quantity =>"1",
                     :FisterraCode =>"",
                     :HCode =>"8521901000",
                     :OriginCountry =>"CHINA",
                     :Manufacturer =>"30 RUE DE LA STATION, 94440 VILLECRESNES, FRANCE",
                     :FurnitureService =>"FURNITURE",
                     :OrderType =>"#{self.order_type.name}",
                     :ProjectCode =>"",
                     :volume =>"",
                     :Comments =>"-",
                     :NetWeight =>"3,750"}

                  }
             }

     xml=my_hash.to_xml(:root => 'invoice')

     # Create a new file and write to it
     File.open(url, 'w') do |f2|
       # use "\n" for two lines of text
       f2.puts xml
     end
   end

  def destroy_xml
    url=url = get_xml_url
    File.delete(url) if exists_xml
  end

  def exists_xml
    url=url = get_xml_url
    File.exist?(url)
  end

  def destroy_pdf_packing
    url=get_pdf_packing
    File.delete(url) if exists_pdf_packing
  end

  def exists_pdf_packing
    url=get_pdf_packing
    File.exist?(url)
  end

  def destroy_pdf_proforma
    url=get_pdf_proforma
    File.delete(url) if exists_pdf_proforma
  end

  def exists_pdf_proforma
    url=get_pdf_proforma
    File.exist?(url)
  end

end
