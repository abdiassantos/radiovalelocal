class ArticlesController < ApplicationController
  def index
    @q = Article.active.order(created_at: :desc).ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:pagina]).per(10)
  end
  
  def show
    @article = Article.find_by_slug params[:id]
    @article.update count: @article.count + 1
  end
end
