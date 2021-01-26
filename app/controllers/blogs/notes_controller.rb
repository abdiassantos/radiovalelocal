class Blogs::NotesController < ApplicationController
  def index
    @blog = Blog.find_by_slug params[:blog_id]
    @notes = @blog.notes.order(created_at: :desc).active.page(params[:pagina]).per(10)
  end
  
  def show
    @note = Note.find_by_slug params[:id]
    @note.update count: @note.count + 1
  end
end
