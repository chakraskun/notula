class NotesController < ApplicationController
    before_action :set_note, only: %i[ show edit update destroy ]
    # before_action :check_login, only: %i[create]
    # before_action :check_owner, only: %i[show update destroy]
  
    # GET /notes or /notes.json
    def index
      @notes = Note.all
      # @notes = Note.where(Noteteamlist.team_id: current_team.id)
      # @noteteamlists = Noteteamlist.all
      # @note = params[:team_id]
      # @notes = Note.where(Noteteamlist.team_id: current_team.id)
      # @notes = Note.includes(:noteteamlists).where(noteteamlist.team_id: current_team.id)
      # User.includes(:organizations).where('organization_users.organization_id' => current_user.organization_ids, :admin => true)
    end
  
    # GET /notes/1 or /notes/1.json
    def show
      @note = scope.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Invoice No.",
          page_size: 'A4',
          template: "notes/show.html.erb",
          layout: "pdf.html",
          lowquality: false,
          zoom: 1,
          dpi: 150
        end
      end
    end
  
    # GET /notes/new
    def new
      @note = Note.new
    end
  
    # GET /notes/1/edit
    def edit
    end
  
    # POST /notes or /notes.json
    def create
      @note = Note.new(note_params)
      # @noteteamlist = Noteteamlist.new([:team_id: [current_team.id]])
      respond_to do |format|
        if @note.save
          # noteteamlists.create(team_id: note_params[:current_team][:id])
          # @note.noteteamlists.create(team_id: [:id])
          format.html { redirect_to @note, notice: "Note was successfully created." }
          format.json { render :show, status: :created, location: @note }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /notes/1 or /notes/1.json
    def update
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to @note, notice: "Note was successfully updated." }
          format.json { render :show, status: :ok, location: @note }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /notes/1 or /notes/1.json
    def destroy
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_note
        @note = Note.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def note_params
        @note_params ||= params.require(:note).permit(:letternum, :agenda, :datetim,:addnote, :attendance, minutelists_attributes: [:id, :member, :minute, :_destroy] )
      end

      def scope
        ::Note.all
      end

      # def team_params
      #   @team_params ||= params.require(:noteteamlist).permit(:team_id)
      # end

      # def check_owner
      #   head :forbidden unless @noteteamlist.team_id == current_team.id
      # end
  end
