# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :get_most_articles

  def get_most_articles
    @youtube_live = Medium.find_by(kind: "youtube")
    @super_banners = Banner.where(kind: 0)
    @side_banners = Banner.where(kind: 1)
    @alert_banner = Banner.where(kind: 2).last
    @banner_middle = Banner.where(kind: 3).last
    @radio_live = Radio.last
    @most_articles = Article.active.joins(:editory).order(count: :desc).first(4)
    @main_banner = Banner.where(kind: 4).last
    @q = Article.ransack(params[:q])
  end
end
