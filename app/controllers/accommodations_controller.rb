class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  # GET /accommodations
  # GET /accommodations.json
  def index
    if params[:search].present?
      @accommodations = Accommodation.near(params[:search], 50, :order => :distance)
    else
      @accommodations = Accommodation.all
    end
  end

  # GET /accommodations/1
  # GET /accommodations/1.jso
  def show
    @stay = Stay.new
  end

  # GET /accommodations/new
  def new
    authorize(Accommodation)
    @accommodation = Accommodation.new
    @host = params[:profile_id]
  end

  # GET /accommodations/1/edits
  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.date_created = Time.now
    @accommodation.host = User.find(params[:profile_id])
    authorize(@accommodation)
    @accommodation.accommodation_rating = 0
    respond_to do |format|
      if @accommodation.save!
        format.html { redirect_to @accommodation, notice: "Accommodation was successfully created." }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
  def update
    authorize(@accommodation)
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: "Accommodation was successfully updated." }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    authorize(@accommodation)
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: "Accommodation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def accommodation_params
    params.require(:accommodation).permit(:name, :description, :country, :city, :address, :host_id, :available_start_date, :available_end_date, :accomtype_id, :hero_image, :interior_image, :accommodation_rating)
  end
end
