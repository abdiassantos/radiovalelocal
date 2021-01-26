# frozen_string_literal: true

class Admin::ArticlesController < AdminController
  before_action :set_admin_article, only: %i[show edit update destroy enable]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    @q = Article.joins(:editory).ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @articles = @q.result.page(params[:pagina])
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.json
  def show; end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit; end

  # POST /admin/articles
  # POST /admin/articles.json
  def create
    @article = Article.new(admin_article_params)
    @article.user_id = current_user.try(:id) || 1
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1
  # PATCH/PUT /admin/articles/1.json
  def update
    respond_to do |format|
      if @article.update(admin_article_params)
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.json
  def destroy
    respond_to do |format|
      if @article.update(status: "disabled")
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def enable
    respond_to do |format|
      if @article.update(status: "enabled")
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_article
    @article = Article.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_article_params
    params.fetch(:article).permit!
  end
end
