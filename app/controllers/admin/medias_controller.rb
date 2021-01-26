# frozen_string_literal: true

class Admin::MediasController < AdminController
  before_action :set_admin_video, only: %i[show edit update destroy]

  # GET /admin/videos
  # GET /admin/videos.json
  def index
    @videos = Medium.where(kind: "youtube")
  end


  # GET /admin/videos/1/edit
  def edit; end

  # PATCH/PUT /admin/videos/1
  # PATCH/PUT /admin/videos/1.json
  def update
    respond_to do |format|
      if @video.update(admin_video_params)
        format.html { redirect_to admin_medias_url, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_video
    @video = Medium.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_video_params
    params.require(:medium).permit!
  end
end
