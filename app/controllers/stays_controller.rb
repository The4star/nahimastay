class StaysController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]

  # GET /stays
  # GET /stays.json
  def index
    @stays = Stay.all
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
    @stay = Stay.new(stay_params)

    respond_to do |format|
      if @stay.save
        format.html { redirect_to @stay, notice: 'Stay was successfully created.' }
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
        format.html { redirect_to @stay, notice: 'Stay was successfully updated.' }
        format.json { render :show, status: :ok, location: @stay }
      else
        format.html { render :edit }
        format.json { render json: @stay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stays/1
  # DELETE /stays/1.json
  def destroy
    @stay.destroy
    respond_to do |format|
      format.html { redirect_to stays_url, notice: 'Stay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stay
      @stay = Stay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stay_params
      params.require(:stay).permit(:accommodation_id, :start_date, :end_date, :user_id, :created_at, :confirmed, :rejected)
    end
end
