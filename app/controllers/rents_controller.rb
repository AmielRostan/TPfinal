class RentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_rent, only: %i[ show edit update destroy ]

  # GET /rents or /rents.json
  def index
    @rents = Rent.all
    @rents = @rents.order(:name).page(params[:page] || 1)
  end

  # GET /rents/1 or /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents or /rents.json
  def create
    @rent = Rent.new(rent_params)


# METODO PARA HACER EL VALOR DEL PAGO
    totalpay = (@rent.ends_at - @rent.begins_at).to_i
    totalpay = totalpay * @rent.vehicle.value
    @rent.pay = totalpay


    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: "Rent was successfully created." }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rents/1 or /rents/1.json
  def update
    kms = @rent.kilometres
    @rent.vehicle.kilometres = @rent.vehicle.kilometres.to_i + kms.to_i


    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to @rent, notice: "Rent was successfully updated." }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1 or /rents/1.json
  def destroy
    @rent.destroy
    respond_to do |format|
      format.html { redirect_to rents_url, notice: "Rent was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:vehicle_id, :user_id, :begins_at, :ends_at, :pay, :kilometres, :return)
    end
end
