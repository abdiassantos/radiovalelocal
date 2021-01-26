# frozen_string_literal: true

class Admin::BlogsController < AdminController
  before_action :set_admin_blog, only: %i[show edit update destroy]

  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @q = Blog.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @blogs = @q.result.page(params[:pagina])
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show; end

  # GET /admin/blogs/new
  def new
    @blog = Blog.new
  end

  # GET /admin/blogs/1/edit
  def edit; end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @blog = Blog.new(admin_blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_url, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/blogs/1
  # PATCH/PUT /admin/blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(admin_blog_params)
        format.html { redirect_to admin_blogs_url, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_blog
    @blog = Blog.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_blog_params
    params.require(:blog).permit!
  end
end
