class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  
  def show
    @blog = Blog.find_by_slug params[:id]
  end
end
