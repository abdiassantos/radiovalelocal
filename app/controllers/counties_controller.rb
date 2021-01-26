class CountiesController < ApplicationController
  def index
    @counties = County.all
  end
  
  def show
    @county = County.find_by_slug params[:id]
    @news = @county.news.page(params[:pagina]).per(10)
  end
end
