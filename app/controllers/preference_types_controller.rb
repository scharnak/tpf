class PreferenceTypesController < ApplicationController
  before_action :set_preference_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /preference_types
  # GET /preference_types.json
  def index
    @preference_types = PreferenceType.all
  end

  # GET /preference_types/1
  # GET /preference_types/1.json
  def show
  end

  # GET /preference_types/new
  def new
    @preference_type = PreferenceType.new
  end

  # GET /preference_types/1/edit
  def edit
  end

  # POST /preference_types
  # POST /preference_types.json
  def create
    @preference_type = PreferenceType.new(preference_type_params)

    respond_to do |format|
      if @preference_type.save
        format.html { redirect_to @preference_type, notice: 'Preference type was successfully created.' }
        format.json { render :show, status: :created, location: @preference_type }
      else
        format.html { render :new }
        format.json { render json: @preference_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preference_types/1
  # PATCH/PUT /preference_types/1.json
  def update
    respond_to do |format|
      if @preference_type.update(preference_type_params)
        format.html { redirect_to @preference_type, notice: 'Preference type was successfully updated.' }
        format.json { render :show, status: :ok, location: @preference_type }
      else
        format.html { render :edit }
        format.json { render json: @preference_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preference_types/1
  # DELETE /preference_types/1.json
  def destroy
    @preference_type.destroy
    respond_to do |format|
      format.html { redirect_to preference_types_url, notice: 'Preference type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference_type
      @preference_type = PreferenceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_type_params
      params.require(:preference_type).permit(:name)
    end
end
