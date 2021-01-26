class VideosController < ApplicationController
  def youtube
    @media = Medium.find_by(kind: "youtube")
  end
  
  def index
    @videos = Video.all.page(params[:pagina]).per(10)
  end
  
  def show
    @video = Video.find params[:id]
  end
end
