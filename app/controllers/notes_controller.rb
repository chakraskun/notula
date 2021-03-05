class NotesController < ApplicationController
    before_action :set_note, only: %i[ show edit update destroy ]
    # before_action :check_login, only: %i[create]
    # before_action :check_owner, only: %i[show update destroy]
  
    # GET /notes or /notes.json
    def index
      @notes = Note.all
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
          dpi: 150,
          margin:{
            top: 2,
            bottom: 2
          },
          footer: {
            html: {
              template: "layouts/_footer_pdf.html.erb"
            }
          }
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
      respond_to do |format|
        if @note.save
          @note.noteteamlists.create(team_id: current_team.id)
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
        # params[:note][:attendance] ||= []
        @note_params ||= params.require(:note).permit(:letternum, :agenda, :datetim, :addnote, :attend => [], minutelists_attributes: [:id, :member, :minute, :_destroy] )
      end

      def scope
        ::Note.all
      end

      # def check_owner
      #   head :forbidden unless @noteteamlist.team_id == current_team.id
      # end
  end
