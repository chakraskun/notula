module Api
    module V1
        class NotesController < ApplicationController
            # before_action :check_login, only: %i[create]
            # before_action :check_owner, only: %i[update destroy]

            def index
                note = Note.all
                render json: NotesSerializer.new(note, options).serialized_json
            end

            def show
                note = Note.find_by(id: params[:id])
                render json: NotesSerializer.new(note, options).serialized_json
            end

            def create
                binding.pry
                note = Note.new(note_params)
                if note.save
                    note.noteteamlists.create(team_id: params[:note][:team][:id])
                    render json: NotesSerializer.new(note, options).serialized_json
                else
                    render json: {error: note.errors.messages}, status: 422
                end
            end

            def update
                note = Note.find_by(id: params[:id])
                if note.update(note_params)
                    render json: NotesSerializer.new(note).serialized_json
                else
                    render json: {error: note.errors.messages}, status: 422
                end
            end

            def destroy
                note = Note.find_by(id: params[:id])
                if note.destroy
                    render :no_content
                else
                    render json: {error: note.errors.messages}, status: 204
                end
            end

            private

            def note_params
                params.require(:note).permit(:letternum, :agenda, :datetim, :minutes, :addnote, :attendance, noteteamlists: [:note_id, :team_id])
            end

            def options
                @options ||= { include: %i[teams]} 
            end
        end
    end
end