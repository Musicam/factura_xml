class InvocesController < ApplicationController
  before_action :set_invoce, only: [:show, :edit, :update, :destroy]

  # GET /invoces
  # GET /invoces.json
  def index
    @invoces = Invoce.all
  end

  # GET /invoces/1
  # GET /invoces/1.json
  def show
  end

  # GET /invoces/new
  def new
    @invoce = Invoce.new
  end

  # GET /invoces/1/edit
  def edit
  end

  # POST /invoces
  # POST /invoces.json
  def create
    @invoce = Invoce.new(invoce_params)

    respond_to do |format|
      if @invoce.save
        format.html { redirect_to @invoce, notice: 'Invoce was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoce }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoces/1
  # PATCH/PUT /invoces/1.json
  def update
    respond_to do |format|
      if @invoce.update(invoce_params)
        format.html { redirect_to @invoce, notice: 'Invoce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoces/1
  # DELETE /invoces/1.json
  def destroy
    @invoce.destroy
    respond_to do |format|
      format.html { redirect_to invoces_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoce
      @invoce = Invoce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoce_params
      params.require(:invoce).permit(:invoced_company_id, :order_type_id, :shop, :quantity, :invoce_number, :invocedate)
    end
end
