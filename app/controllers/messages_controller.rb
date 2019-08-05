class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @stay = Stay.find(params[:message][:stay_id])
    if params[:message][:guest_id]
      @guest = User.find(params[:message][:guest_id])
    elsif params[:message][:accommodation_id]
      @accommodation = Accommodation.find(params[:message][:accommodation_id])
    end
    @message = Message.new(message_params)
    @message.created_at = Time.now
    respond_to do |format|
      if @message.save!
        if params[:message][:accommodation_id]
          format.html { redirect_to stay_path(@stay, accommodation_id: @accommodation.id), notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        elsif params[:message][:guest_id]
          format.html { redirect_to stay_path(@stay, guest_id: @guest.id), notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        end
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @stay = Stay.find(params[:stay_id])
    if params[:guest_id]
      @guest = User.find(params[:guest_id])
    elsif params[:accommodation_id]
      @accommodation = Accommodation.find(params[:accommodation_id])
    end

    @message.destroy
    respond_to do |format|
      if params[:accommodation_id]
        format.html { redirect_to stay_path(@stay, accommodation_id: @accommodation.id), notice: 'Message was successfully destroyed.' }
        format.json { head :no_content }
      elsif params[:accommodation_id]
        format.html { redirect_to stay_path(@stay, guest_id: @guest.id), notice: 'Message was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :created_at, :stay_id, :user_id)
    end
end
