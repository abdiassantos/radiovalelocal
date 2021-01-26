# frozen_string_literal: true

class Admin::NewsController < AdminController
  before_action :set_admin_news, only: %i[show edit update destroy enable]

  # GET /admin/newss
  # GET /admin/newss.json
  def index
    @q = News.joins(:county).ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @news = @q.result.page(params[:pagina])
  end

  # GET /admin/newss/1
  # GET /admin/newss/1.json
  def show; end

  # GET /admin/newss/new
  def new
    @news = News.new
  end

  # GET /admin/newss/1/edit
  def edit; end

  # POST /admin/newss
  # POST /admin/newss.json
  def create
    @news = News.new(admin_news_params)
    @news.user_id = current_user.try(:id)
    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_index_url, notice: 'news was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/newss/1
  # PATCH/PUT /admin/newss/1.json
  def update
    respond_to do |format|
      if @news.update(admin_news_params)
        format.html { redirect_to admin_news_index_url, notice: 'news was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/newss/1
  # DELETE /admin/newss/1.json
  def destroy
    respond_to do |format|
      if @news.update(status: "disabled")
        format.html { redirect_to admin_news_index_url, notice: 'news was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def enable
    respond_to do |format|
      if @news.update(status: "enabled")
        format.html { redirect_to admin_news_index_url, notice: 'news was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_news
    @news = News.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_news_params
    params.fetch(:news).permit!
  end
end
