class AttachementsController < ApplicationController
  before_action :set_attachement, only: %i[ show edit update destroy create_zip]
  require 'zip'

  # GET /attachements or /attachements.json
  def index
    if current_user.present?
      @attachements= current_user.attachements.paginate(page: params[:page]).order('created_at DESC')
    end
  end

  # GET /attachements/1 or /attachements/1.json
  def show

  end

  # GET /attachements/new
  def new
    @attachement = Attachement.new
  end

  # GET /attachements/1/edit
  def edit
  end

  # POST /attachements or /attachements.json
  def create
    @attachement = Attachement.new(attachement_params)
    respond_to do |format|
      if @attachement.save
        @attachement.update_file_url(url_for(@attachement.file)) if @attachement.file.present?
        format.html { redirect_to attachement_url(@attachement), notice: "Attachement was successfully created." }
        format.json { render :show, status: :created, location: @attachement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachements/1 or /attachements/1.json
  def update
    respond_to do |format|
      if @attachement.update(attachement_params)
        @attachement.update_file_url(url_for(@attachement.file)) if @attachement.file.present?
        format.html { redirect_to attachement_url(@attachement), notice: "Attachement was successfully updated." }
        format.json { render :show, status: :ok, location: @attachement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachements/1 or /attachements/1.json
  def destroy
    @attachement.destroy

    respond_to do |format|
      format.html { redirect_to attachements_url, notice: "Attachement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachement
      @attachement = Attachement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachement_params
      params.require(:attachement).permit(:title, :string, :file, :user_id)
    end
end
