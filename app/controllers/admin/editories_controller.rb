class Admin::EditoriesController < AdminController
  before_action :set_admin_editory, only: [:show, :edit, :update, :destroy]

  # GET /admin/editories
  # GET /admin/editories.json
  def index
    @q = Editory.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @editories = @q.result.page(params[:pagina])
  end

  # GET /admin/editories/1
  # GET /admin/editories/1.json
  def show
  end

  # GET /admin/editories/new
  def new
    @editory = Editory.new
  end

  # GET /admin/editories/1/edit
  def edit
  end

  # POST /admin/editories
  # POST /admin/editories.json
  def create
    @editory = Editory.new(admin_editory_params)

    respond_to do |format|
      if @editory.save
        format.html { redirect_to admin_editories_url, notice: 'Editory was successfully created.' }
        format.json { render :show, status: :created, location: @editory }
      else
        format.html { render :new }
        format.json { render json: @editory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/editories/1
  # PATCH/PUT /admin/editories/1.json
  def update
    respond_to do |format|
      if @editory.update(admin_editory_params)
        format.html { redirect_to admin_editories_url, notice: 'Editory was successfully updated.' }
        format.json { render :show, status: :ok, location: @editory }
      else
        format.html { render :edit }
        format.json { render json: @editory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/editories/1
  # DELETE /admin/editories/1.json
  def destroy
    @editory.destroy
    respond_to do |format|
      format.html { redirect_to admin_editories_url, notice: 'Editory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_editory
      @editory = Editory.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_editory_params
      params.require(:editory).permit!
    end
end
