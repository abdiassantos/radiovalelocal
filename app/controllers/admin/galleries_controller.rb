# frozen_string_literal: true

class Admin::GalleriesController < AdminController
  before_action :set_admin_gallery, only: %i[show edit update destroy]

  # GET /admin/galleries
  # GET /admin/galleries.json
  def index
    @q = Gallery.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @galleries = @q.result.page(params[:pagina])
  end

  # GET /admin/galleries/1
  # GET /admin/galleries/1.json
  def show; end

  # GET /admin/galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /admin/galleries/1/edit
  def edit; end

  # POST /admin/galleries
  # POST /admin/galleries.json
  def create
    @gallery = Gallery.new(admin_gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/galleries/1
  # PATCH/PUT /admin/galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(admin_gallery_params)
        format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/galleries/1
  # DELETE /admin/galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_gallery
    @gallery = Gallery.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_gallery_params
    params.require(:gallery).permit!
  end
end
