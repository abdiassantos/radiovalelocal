# frozen_string_literal: true

class Admin::EventsController < AdminController
  before_action :set_admin_event, only: %i[show edit update destroy]

  # GET /admin/events
  # GET /admin/events.json
  def index
    @q = Event.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @events = @q.result.page(params[:pagina])
  end

  # GET /admin/events/1
  # GET /admin/events/1.json
  def show; end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # GET /admin/events/1/edit
  def edit; end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @event = Event.new(admin_event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_url, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/events/1
  # PATCH/PUT /admin/events/1.json
  def update
    respond_to do |format|
      if @event.update(admin_event_params)
        format.html { redirect_to admin_events_url, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_event
    @event = Event.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_event_params
    params.require(:event).permit!
  end
end
