class PagesController < ApplicationController
  def index
    @bar_articles = Article.active.joins(:editory).order(published_at: :desc).first(4)
    @main_articles = []
    
    Editory.where(id: [1,2,3,4]).each do |editory|
      if editory.articles.active.order(published_at: :desc).first
        @main_articles.push(editory.articles.order(published_at: :desc).first) 
      end
    end
    if @main_articles.size <= 0
      @main_articles = Article.joins(:editory).active.order(published_at: :desc).first(4)
    end
    @last_articles = Article.joins(:editory).active.order(published_at: :desc).first(4)
    @editor_articles = Article.joins(:editory).active.order(published_at: :desc).first(10)
    @editories = Editory.last(4)
    @first_city = County.last(2).last
    @second_city = County.last(2).first
  end

  def about_radio
    @page = Page.find_by(kind: "about_radio")
  end
  
  def about_group
    @page = Page.find_by(kind: "about_group")
  end
end
