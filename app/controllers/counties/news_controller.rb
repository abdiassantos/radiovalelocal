class Counties::NewsController < ApplicationController
  def index
    @news = News.active.order(created_at: :desc).page(params[:pagina]).per(10)
  end
  
  def show
    @news = News.find_by_slug params[:id]
    @news.update count: @news.count + 1
  end
end
