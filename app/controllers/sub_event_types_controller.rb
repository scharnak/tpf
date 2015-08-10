class SubEventTypesController < ApplicationController
  before_action :set_sub_event_type, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /sub_event_types
  # GET /sub_event_types.json
  def index
    @sub_event_types = SubEventType.all
  end

  # GET /sub_event_types/1
  # GET /sub_event_types/1.json
  def show
  end

  # GET /sub_event_types/new
  def new
    @sub_event_type = SubEventType.new
  end

  # GET /sub_event_types/1/edit
  def edit
  end

  # POST /sub_event_types
  # POST /sub_event_types.json
  def create
    @sub_event_type = SubEventType.new(sub_event_type_params)

    respond_to do |format|
      if @sub_event_type.save
        format.html { redirect_to @sub_event_type, notice: 'Sub event type was successfully created.' }
        format.json { render :show, status: :created, location: @sub_event_type }
      else
        format.html { render :new }
        format.json { render json: @sub_event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_event_types/1
  # PATCH/PUT /sub_event_types/1.json
  def update
    respond_to do |format|
      if @sub_event_type.update(sub_event_type_params)
        format.html { redirect_to @sub_event_type, notice: 'Sub event type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_event_type }
      else
        format.html { render :edit }
        format.json { render json: @sub_event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_event_types/1
  # DELETE /sub_event_types/1.json
  def destroy
    @sub_event_type.destroy
    respond_to do |format|
      format.html { redirect_to sub_event_types_url, notice: 'Sub event type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_event_type
      @sub_event_type = SubEventType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_event_type_params
      params.require(:sub_event_type).permit(:name, :description)
    end
end
