class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all.page(params[:pagina]).per(10)
  end
  
  def show
    @gallery = Gallery.find_by_slug(params[:id])
  end
end
