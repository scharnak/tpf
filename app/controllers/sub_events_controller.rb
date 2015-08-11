class SubEventsController < ApplicationController
  before_action :set_sub_event, only: [:show, :edit, :update, :destroy, :sign_up]

  load_and_authorize_resource
  # GET /sub_events
  # GET /sub_events.json
  def index
    @sub_events = SubEvent.all
  end

  def task_remove
    hours = ((@sub_event.start_time-Time.now)/1.hour).round
    if hours <= 24
      response = {alert: "This task begins in #{hours} hours.  You must give at least 24 hours notice to remove yourself from a task!"}
    else
      @sub_event.users.delete(current_user)
      response = {notice: "You have been removed from this task."}
    end 
    redirect_to event_path(@sub_event.event), response
  end

  def sign_up
    if @sub_event.volunteer_count(current_user.role) < @sub_event.try(current_user.role + '_num')

      if !@sub_event.users.include?(current_user)
        @sub_event.users << current_user
        @sub_event.save
        response = {notice: "You've been added to this task!"}
      else
        response =  {alert: "You've already been added to this task!"}
      end
      redirect_to event_path(@sub_event.event), response
    else
      redirect_to event_path(@sub_event.event), alert: "This task is already full!"
    end
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
    @sub_event.event_id = params[:event_id]

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
      params.require(:sub_event).permit(:sub_event_type_id, :event_id, :name, :intern_num, :staff_num, :community_num, :start_time, :end_time)
    end
end
