class EditoriesController < ApplicationController
  before_action :get_editory
  
  def index
    @editories = Editory.all
  end
  
  def show
    @articles = @editory.articles.active.page(params[:pagina])
  end

  private
  def get_editory
    @editory = Editory.find_by_slug(params[:id])
  end
end
