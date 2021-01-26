class BlogCitiesController < ApplicationController
  def index
    @blogs = Blog.where(kind: "county")
  end

  def show
  end
end
