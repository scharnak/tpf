class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :complete_event]
  after_action :email, only: [:create]
  #before_action :check, only: [:create]

  before_filter :set_start_day

  load_and_authorize_resource

  def index
    @events = Event.order("date DESC").where(completed_at: nil)
  end

  def show
    @tasks = @event.sub_events.order("start_time ASC")
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
      @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
        else
          format.html { render :new }
        end
      end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_type_id, :name, :date)
    end

    def set_start_day
      Date.beginning_of_week = :monday
    end
end
