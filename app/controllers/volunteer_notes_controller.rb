class VolunteerNotesController < ApplicationController
  before_action :set_volunteer_note, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /volunteer_notes
  # GET /volunteer_notes.json
  def index
    @volunteer_notes = VolunteerNote.all
  end

  # GET /volunteer_notes/1
  # GET /volunteer_notes/1.json
  def show
  end

  # GET /volunteer_notes/new
  def new
    @user = User.find(params[:user_id])
    @volunteer_note = VolunteerNote.new
    @volunteer_note.user_id = params[:user_id]
    @volunteer_note.created_by_user_id = current_user.id
  end

  # GET /volunteer_notes/1/edit
  def edit
  end

  # POST /volunteer_notes
  # POST /volunteer_notes.json
  def create
    @volunteer_note = VolunteerNote.new(volunteer_note_params)

    respond_to do |format|
      if @volunteer_note.save
        format.html { redirect_to user_path(params[:user_id]), notice: 'Volunteer note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /volunteer_notes/1
  # PATCH/PUT /volunteer_notes/1.json
  def update
    respond_to do |format|
      if @volunteer_note.update(volunteer_note_params)
        format.html { redirect_to @volunteer_note, notice: 'Volunteer note was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer_note }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_notes/1
  # DELETE /volunteer_notes/1.json
  def destroy
    @volunteer_note.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_notes_url, notice: 'Volunteer note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_note
      @volunteer_note = VolunteerNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_note_params
      params.require(:volunteer_note).permit(:user_id, :created_by_user_id, :description)
    end
end
