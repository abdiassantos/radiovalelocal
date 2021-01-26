# frozen_string_literal: true

class Admin::BannersController < AdminController
  before_action :set_admin_banner, only: %i[show edit update destroy enable]

  # GET /admin/banners
  # GET /admin/banners.json
  def index
    @q = Banner.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @banners = @q.result.page(params[:pagina])
  end

  # GET /admin/banners/1
  # GET /admin/banners/1.json
  def show; end

  # GET /admin/banners/new
  def new
    @banner = Banner.new
  end

  # GET /admin/banners/1/edit
  def edit; end

  # POST /admin/banners
  # POST /admin/banners.json
  def create
    @banner = Banner.new(admin_banner_params)
    @banner.bannerable_type = "Article"
    @banner.bannerable_id = Article.last.id
    @banner.banner_category_id = BannerCategory.last.id
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_url, notice: 'banner was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/banners/1
  # PATCH/PUT /admin/banners/1.json
  def update
    respond_to do |format|
      if @banner.update(admin_banner_params)
        format.html { redirect_to admin_banners_url, notice: 'banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/banners/1
  # DELETE /admin/banners/1.json
  def destroy
    respond_to do |format|
      if @banner.destroy
        format.html { redirect_to admin_banners_url, notice: 'banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_banner
    @banner = Banner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_banner_params
    params.fetch(:banner).permit!
  end
end
