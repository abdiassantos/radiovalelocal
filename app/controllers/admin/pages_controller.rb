class Admin::PagesController < AdminController
  before_action :set_admin_page, only: %i[show edit update destroy enable]
  
  def dashboard
  end
  # GET /admin/pages
  # GET /admin/pages.json
  def index
    @q = Page.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @pages = @q.result.page(params[:pagina])
  end

  # GET /admin/pages/1
  # GET /admin/pages/1.json
  def show; end

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # GET /admin/pages/1/edit
  def edit; end

  # POST /admin/pages
  # POST /admin/pages.json
  def create
    @page = Page.new(admin_page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_url, notice: 'page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pages/1
  # PATCH/PUT /admin/pages/1.json
  def update
    respond_to do |format|
      if @page.update(admin_page_params)
        format.html { redirect_to admin_pages_url, notice: 'page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_page
    @page = Page.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_page_params
    params.fetch(:page).permit!
  end

end
