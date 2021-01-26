# frozen_string_literal: true

class Admin::SocialNetworksController < AdminController
  before_action :set_admin_social_network, only: %i[show edit update destroy]

  # GET /admin/social_networks
  # GET /admin/social_networks.json
  def index
    @q = SocialNetwork.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @social_networks = @q.result.page(params[:pagina])
  end

  # GET /admin/social_networks/1
  # GET /admin/social_networks/1.json
  def show; end

  # GET /admin/social_networks/new
  def new
    @social_network = SocialNetwork.new
  end

  # GET /admin/social_networks/1/edit
  def edit; end

  # POST /admin/social_networks
  # POST /admin/social_networks.json
  def create
    @social_network = SocialNetwork.new(admin_social_network_params)

    respond_to do |format|
      if @social_network.save
        format.html { redirect_to admin_videos_url, notice: 'Social network was successfully created.' }
        format.json { render :show, status: :created, location: @social_network }
      else
        format.html { render :new }
        format.json { render json: @social_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/social_networks/1
  # PATCH/PUT /admin/social_networks/1.json
  def update
    respond_to do |format|
      if @social_network.update(admin_social_network_params)
        format.html { redirect_to admin_videos_url, notice: 'Social network was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_network }
      else
        format.html { render :edit }
        format.json { render json: @social_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/social_networks/1
  # DELETE /admin/social_networks/1.json
  def destroy
    @social_network.destroy
    respond_to do |format|
      format.html { redirect_to admin_social_networks_url, notice: 'Social network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_social_network
    @social_network = SocialNetwork.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_social_network_params
    params.require(:social_network).permit!
  end
end
