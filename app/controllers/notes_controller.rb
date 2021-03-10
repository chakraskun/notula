# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  # before_action :check_login, only: %i[create]
  # before_action :check_owner, only: %i[show update destroy]

  def authorize
    client = OAuth2::Client.new(Rails.application.secrets.googledrive_key,
              Rails.application.secrets.googledrive_secret,
              :site => 'https://accounts.google.com',
              :authorize_url => '/o/oauth2/auth')
    redirect_to client.auth_code.authorize_url(:redirect_uri => googledrive_callback_url, :scope => 'https://www.googleapis.com/auth/drive', :access_type => 'offline')
  end
  
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
        render pdf: 'Invoice No.',
               page_size: 'A4',
               template: 'notes/show.html.erb',
               layout: 'pdf.html',
               lowquality: false,
               zoom: 1,
               dpi: 150,
               margin: {
                 top: 2,
                 bottom: 2
               },
               footer: {
                 html: {
                   template: 'layouts/_footer_pdf.html.erb'
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
  def edit; end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        @note.noteteamlists.create(team_id: current_team.id)
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
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
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
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
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
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
    @note_params ||= params.require(:note).permit(:letternum, :agenda, :datetim, :addnote, :attendance,
                                                  attend: [], minutelists_attributes: %i[id member minute _destroy])
  end

  def scope
    ::Note.all
  end

  def get_token
    service = current_team.services.find_by(name: "Googledrive")
    client = OAuth2::Client.new(Rails.application.secrets.googledrive_key,
                  Rails.application.secrets.googledrive_secret,
                  :site => 'https://accounts.google.com',
                  :response_type => 'code',
                  :token_url => '/o/oauth2/token',
                                :access_type => 'offline')
    if !service
      token = client.auth_code.get_token(params[:code], :redirect_uri => googledrive_callback_url)
      drive_info = JSON.parse(RestClient.get("https://www.googleapis.com/drive/v2/about", {:Authorization => "Bearer #{token.token}"}))
      service = current_team.services.create!(name: "Googledrive", access_token: token.to_hash, used_space: drive_info["quotaBytesUsedAggregate"], total_space: drive_info["quotaBytesTotal"])
    elsif Time.at(eval(service.access_token)[:expires_at]) < Time.now
      token = OAuth2::AccessToken.from_hash(client, eval(service.access_token))
      service.update(access_token: token.refresh!.to_hash)
    end
    @token = eval(service.access_token)[:access_token]
  end

  # def check_owner
  #   head :forbidden unless @noteteamlist.team_id == current_team.id
  # end
end
