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
    end
    if @stays.first
      authorize(@stays.first)
    end
  end

  def guest
  end

  def accom
  end

  # GET /stays/1
  # GET /stays/1.json
  def show
    authorize(@stay)
    if params[:accommodation_id]
      @accommodation = Accommodation.find(params[:accommodation_id])
      @title = @accommodation.name
    elsif params[:guest_id]
      @guest = User.find(params[:guest_id]).profile
      @title = "#{@guest.first_name} #{@guest.last_name}"
    end

    @stay_length = @stay.end_date.day - @stay.start_date.day
    @stay_cost = @stay_length. * @stay.accommodation.accomtype.cost

  end

  # GET /stays/new
  def new
    @stay = Stay.new
  end

  # GET /stays/1/edit
  def edit
    @stay = Stay.find(params[:id])
    authorize(@stay)
  end

  # POST /stays
  # POST /stays.json
  def create
    @stay = Stay.new(stay_params)
    @stay_length = @stay.end_date.day - @stay.start_date.day
    @stay_cost = @stay_length. * @stay.accommodation.accomtype.cost
    if current_user.profile.karma_coins < @stay_cost
      respond_to do |format|
        format.html { redirect_to accommodation_path(@stay.accommodation, guest_id: current_user.id), notice: "You do not have enough Karma Coins to request this stay." }
      end
    else
      @stay.guest = User.find(current_user.id)
      @stay.created_at = Time.now
      @stay.confirmed = false
      @stay.rejected = false

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

  def update_status
    @stay = Stay.find(params[:stay])
    authorize(@stay)
    @stay_length = @stay.end_date.day - @stay.start_date.day
    @stay_cost = @stay_length. * @stay.accommodation.accomtype.cost
    if params[:confirmed]
      @stay.update(confirmed: params[:confirmed], rejected: false)
      @stay.accommodation.host.profile.increment!(:karma_coins, @stay_cost) 
      @stay.accommodation.host.save! 
      @stay.guest.profile.decrement!(:karma_coins, @stay_cost) 
      @stay.guest.profile.save!
      @stay.save!
    elsif params[:rejected]
      @stay.update(rejected: params[:rejected], confirmed: false)
      @stay.save!
    elsif params[:cancelled]
      @stay.update(cancelled: params[:cancelled], confirmed: false, rejected: true)
      @stay.accommodation.host.profile.decrement!(:karma_coins, @stay_cost) 
      @stay.accommodation.host.save! 
      @stay.guest.profile.increment!(:karma_coins, @stay_cost) 
      @stay.guest.profile.save!  
      @stay.save!
    end

    redirect_to @stay

  end 


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stay
    print params
    @stay = Stay.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stay_params
    params.require(:stay).permit(:accommodation_id, :start_date, :end_date, :created_at)
  end
end
