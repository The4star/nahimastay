class AccommodationreviewsController < ApplicationController
  before_action :set_accommodationreview, only: [:show, :edit, :update, :destroy]

  # GET /accommodationreviews
  # GET /accommodationreviews.json
  def index
    authorize(@accommodationreview)
    @accommodationreviews = Accommodationreview.all
  end

  # GET /accommodationreviews/1
  # GET /accommodationreviews/1.json
  def show
    authorize(@accommodationreview)
  end

  # GET /accommodationreviews/new
  def new
    @stay_id = params[:stay_id]
    @accommodationreview = Accommodationreview.new
  end

  # POST /accommodationreviews
  # POST /accommodationreviews.json
  def create
    @accommodationreview = Accommodationreview.new(accommodationreview_params)
    @accommodationreview.stay_id = params[:stay_id]
    @accommodationreview.created_at = Time.now

    authorize(@accommodationreview)

    # Update Host Rating
    Stay.find(params[:stay_id]).accommodation.host.profile.update_host_rating(params[:accommodationreview][:host_rating])

    # Update Accommodation Rating
    Stay.find(params[:stay_id]).accommodation.update_accommodation_rating(params[:accommodationreview][:communication_rating],
      params[:accommodationreview][:ammenities_rating],
      params[:accommodationreview][:location_rating],
      params[:accommodationreview][:cleanliness_rating])

    respond_to do |format|
      if @accommodationreview.save
        format.html { redirect_to @accommodationreview, notice: 'Accommodationreview was successfully created.' }
        format.json { render :show, status: :created, location: @accommodationreview }
      else
        format.html { render :new }
        format.json { render json: @accommodationreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodationreviews/1
  # PATCH/PUT /accommodationreviews/1.json
  def update
    respond_to do |format|
      if @accommodationreview.update(accommodationreview_params)
        format.html { redirect_to @accommodationreview, notice: 'Accommodationreview was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodationreview }
      else
        format.html { render :edit }
        format.json { render json: @accommodationreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodationreviews/1
  # DELETE /accommodationreviews/1.json
  def destroy
    @accommodationreview.destroy
    respond_to do |format|
      format.html { redirect_to accommodationreviews_url, notice: 'Accommodationreview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodationreview
      @accommodationreview = Accommodationreview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodationreview_params
      params.require(:accommodationreview).permit(:communication_rating, :location_rating, :cleanliness_rating, :ammenities_rating, :host_rating, :comments, :created_at, :stay_id)
    end
end
