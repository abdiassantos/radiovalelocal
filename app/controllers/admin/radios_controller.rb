# frozen_string_literal: true

class Admin::RadiosController < AdminController
  before_action :set_admin_radio, only: %i[show edit update destroy]

  # GET /admin/radios
  # GET /admin/radios.json
  def index
    @q = Radio.all.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @radios = @q.result.page(params[:pagina])
  end

  # GET /admin/radios/1
  # GET /admin/radios/1.json
  def show; end

  # GET /admin/radios/new
  def new
    @radio = Radio.new
  end

  # GET /admin/radios/1/edit
  def edit; end

  # POST /admin/radios
  # POST /admin/radios.json
  def create
    @radio = Radio.new(admin_radio_params)

    respond_to do |format|
      if @radio.save
        format.html { redirect_to admin_radios_url, notice: 'Radio was successfully created.' }
        format.json { render :show, status: :created, location: @radio }
      else
        format.html { render :new }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/radios/1
  # PATCH/PUT /admin/radios/1.json
  def update
    respond_to do |format|
      if @radio.update(admin_radio_params)
        format.html { redirect_to admin_radios_url, notice: 'Radio was successfully updated.' }
        format.json { render :show, status: :ok, location: @radio }
      else
        format.html { render :edit }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/radios/1
  # DELETE /admin/radios/1.json
  def destroy
    @radio.destroy
    respond_to do |format|
      format.html { redirect_to admin_radios_url, notice: 'Radio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_radio
    @radio = Radio.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_radio_params
    params.require(:radio).permit!
  end
end
