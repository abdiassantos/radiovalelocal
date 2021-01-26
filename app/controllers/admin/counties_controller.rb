# frozen_string_literal: true

class Admin::CountiesController < AdminController
  before_action :set_admin_county, only: %i[show edit update destroy]

  # GET /admin/counties
  # GET /admin/counties.json
  def index
    @q = County.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @counties = @q.result.page(params[:pagina])
  end

  # GET /admin/counties/1
  # GET /admin/counties/1.json
  def show; end

  # GET /admin/counties/new
  def new
    @county = County.new
  end

  # GET /admin/counties/1/edit
  def edit; end

  # POST /admin/counties
  # POST /admin/counties.json
  def create
    @county = County.new(admin_county_params)

    respond_to do |format|
      if @county.save
        format.html { redirect_to admin_counties_url, notice: 'County was successfully created.' }
        format.json { render :show, status: :created, location: @county }
      else
        format.html { render :new }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/counties/1
  # PATCH/PUT /admin/counties/1.json
  def update
    respond_to do |format|
      if @county.update(admin_county_params)
        format.html { redirect_to admin_counties_url, notice: 'County was successfully updated.' }
        format.json { render :show, status: :ok, location: @county }
      else
        format.html { render :edit }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/counties/1
  # DELETE /admin/counties/1.json
  def destroy
    @county.destroy
    respond_to do |format|
      format.html { redirect_to admin_counties_url, notice: 'County was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_county
    @county = County.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_county_params
    params.require(:county).permit!
  end
end
