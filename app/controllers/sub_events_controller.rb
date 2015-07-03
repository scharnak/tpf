class SubEventsController < ApplicationController
  before_action :set_sub_event, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  # GET /sub_events
  # GET /sub_events.json
  def index
    @sub_events = SubEvent.all
  end

  def sign_up
    logger.debug('in sign up')
    #query for required user types

    #query for users who are already signed up
    
    #compare the user roles with the required roles
  end

  def show

  end

  # GET /sub_events/new
  def new
    @event = Event.find(params[:event_id])
    @sub_event = SubEvent.new
    @sub_event.event_id = params[:event_id]
  end

  # GET /sub_events/1/edit
  def edit

  end

  # POST /sub_events
  # POST /sub_events.json
  def create
    @sub_event = SubEvent.new(sub_event_params)

    respond_to do |format|
      if @sub_event.save
        format.html { redirect_to event_path(params[:event_id]), notice: 'Sub event was successfully created.' }
        format.json { render :show, status: :created, location: @sub_event }
      else
        format.html { render :new }
        format.json { render json: @sub_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_events/1
  # PATCH/PUT /sub_events/1.json
  def update
    respond_to do |format|
      if @sub_event.update(sub_event_params)
        format.html { redirect_to events_path, notice: 'Sub event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sub_events/1
  # DELETE /sub_events/1.json
  def destroy
    @sub_event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Sub event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_event
      @event = Event.find(params[:event_id])
      @sub_event = SubEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_event_params
      params.require(:sub_event).permit(:event_id, :name, :intern_num, :staff_num, :community_num, :start_time, :end_time)
    end
end
