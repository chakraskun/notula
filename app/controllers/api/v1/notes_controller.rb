module Api
    module V1
        class NotesController < ApplicationController
            def index
                note = Note.all
                render json: NotesSerializer.new(note, options).serialized_json
            end

            def show
                note = Note.find_by(id: params[:id])
                render json: NotesSerializer.new(note, options).serialized_json
            end

            def create
                note = Note.new(note_params)
                if note.save
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
                params.require(:note).permit(:letternum, :agenda, :datetim, :minutes, :addnote)
            end

            def options
                @options ||= { include: %i[teams]} 
            end
        end
    end
end