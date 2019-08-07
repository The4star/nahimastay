class GuestreviewsController < ApplicationController
  before_action :set_guestreview, only: [:show, :edit, :update, :destroy]

  # GET /guestreviews
  # GET /guestreviews.json
  def index
    authorize(@guestreview)
    @guestreviews = Guestreview.all
  end

  # GET /guestreviews/1
  # GET /guestreviews/1.json
  def show
    authorize(@guestreview)
  end

  # GET /guestreviews/new
  def new
    @stay = Stay.find(params[:stay_id])
    @stay_id = params[:stay_id]
    @guestreview = Guestreview.new
  end

  # GET /guestreviews/1/edit
  def edit
  end

  # POST /guestreviews
  # POST /guestreviews.json
  def create
    @guestreview = Guestreview.new(guestreview_params)
    @guestreview.stay_id = params[:stay_id]
    @guestreview.created_at = Time.now

    authorize(@guestreview)


    # Update Guest Rating
    Stay.find(params[:stay_id]).guest.profile.update_guest_rating(params[:guestreview][:cleanliness_rating],
      params[:guestreview][:communication_rating],
      params[:guestreview][:ease_of_hosting_rating])

    respond_to do |format|
      if @guestreview.save
        format.html { redirect_to @guestreview, notice: 'Guestreview was successfully created.' }
        format.json { render :show, status: :created, location: @guestreview }
      else
        format.html { render :new }
        format.json { render json: @guestreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guestreviews/1
  # PATCH/PUT /guestreviews/1.json
  def update
    respond_to do |format|
      if @guestreview.update(guestreview_params)
        format.html { redirect_to @guestreview, notice: 'Guestreview was successfully updated.' }
        format.json { render :show, status: :ok, location: @guestreview }
      else
        format.html { render :edit }
        format.json { render json: @guestreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestreviews/1
  # DELETE /guestreviews/1.json
  def destroy
    @guestreview.destroy
    respond_to do |format|
      format.html { redirect_to guestreviews_url, notice: 'Guestreview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guestreview
      @guestreview = Guestreview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guestreview_params
      params.require(:guestreview).permit(:created_at, :cleanliness_rating, :communication_rating, :ease_of_hosting_rating, :comments, :stay_id)
    end
end
