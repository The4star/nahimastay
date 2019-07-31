class StaysController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]

  # GET /stays
  # GET /stays.json
  def index
    if params[:accommodation_id]
      @accommodation = Accommodation.find(params[:accommodation_id])
      @stays = @accommodation.stays
      @title = @accommodation.name
    elsif params[:guest_id]
      @guest = User.find(params[:guest_id]).profile
      @stays = User.find(params[:guest_id]).stays
      @title = "#{@guest.first_name} #{@guest.last_name}"
    else
      @stays = Stay.all
    end
  end

  def guest
  end

  def accom
  end

  # GET /stays/1
  # GET /stays/1.json
  def show
  end

  # GET /stays/new
  def new
    @stay = Stay.new
  end

  # GET /stays/1/edit
  def edit
  end

  # POST /stays
  # POST /stays.json
  def create
    params[:accom_id] = 1
    @stay = Stay.new(stay_params)
    @stay.guest = User.find(current_user.id)
    @stay.created_at = Time.now
    @stay.confirmed = false
    @stay.rejected = false

    @stay.accommodation = Accommodation.find(params[:accom_id])
    print @stay.accommodation.name

    respond_to do |format|
      if @stay.save
        format.html { redirect_to @stay, notice: "Stay was successfully created." }
        format.json { render :show, status: :created, location: @stay }
      else
        format.html { render :new }
        format.json { render json: @stay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stays/1
  # PATCH/PUT /stays/1.json
  def update
    respond_to do |format|
      if @stay.update(stay_params)
        format.html { redirect_to @stay, notice: "Stay was successfully updated." }
        format.json { render :show, status: :ok, location: @stay }
      else
        format.html { render :edit }
        format.json { render json: @stay.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stay
    print params
    @stay = Stay.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stay_params
    params.require(:stay).permit(:accommodation_id, :start_date, :end_date, :created_at, :accommodation_name)
  end
end
