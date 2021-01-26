class EventsController < ApplicationController
  def index
    @events = Event.all.page(params[:pagina]).per(10)
  end
  
  def show
    @event = Event.find_by_slug(params[:id])
  end
end
