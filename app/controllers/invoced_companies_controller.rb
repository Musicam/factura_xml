class InvocedCompaniesController < ApplicationController
  before_action :set_invoced_company, only: [:show, :edit, :update, :destroy]

  # GET /invoced_companies
  # GET /invoced_companies.json
  def index
    @invoced_companies = InvocedCompany.all
  end

  # GET /invoced_companies/1
  # GET /invoced_companies/1.json
  def show
  end

  # GET /invoced_companies/new
  def new
    @invoced_company = InvocedCompany.new
  end

  # GET /invoced_companies/1/edit
  def edit
  end

  # POST /invoced_companies
  # POST /invoced_companies.json
  def create
    @invoced_company = InvocedCompany.new(invoced_company_params)

    respond_to do |format|
      if @invoced_company.save
        format.html { redirect_to @invoced_company, notice: 'Invoced company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoced_company }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoced_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoced_companies/1
  # PATCH/PUT /invoced_companies/1.json
  def update
    respond_to do |format|
      if @invoced_company.update(invoced_company_params)
        format.html { redirect_to @invoced_company, notice: 'Invoced company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoced_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoced_companies/1
  # DELETE /invoced_companies/1.json
  def destroy
    @invoced_company.destroy
    respond_to do |format|
      format.html { redirect_to invoced_companies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoced_company
      @invoced_company = InvocedCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoced_company_params
      params.require(:invoced_company).permit(:name)
    end
end
