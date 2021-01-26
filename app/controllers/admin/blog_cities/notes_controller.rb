class Admin::BlogCities::NotesController < AdminController
  before_action :set_admin_blog
  before_action :set_admin_note, only: %i[show edit update destroy enable]
  
  def index
    @q = @blog.notes.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @notes = @q.result.page(params[:pagina])
  end
  
  def show
    @note = Note.find_by_slug params[:id]
  end

  # GET /admin/notes/new
  def new
    @note = Note.new
  end

  # GET /admin/notes/1/edit
  def edit; end

  # POST /admin/notes
  # POST /admin/notes.json
  def create
    @note = Note.new(admin_note_params)
    @note.blog_id = @blog.id
    @note.user_id = current_user.try(:id)
    respond_to do |format|
      if @note.save
        format.html { redirect_to admin_blog_city_notes_url, notice: 'note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/notes/1
  # PATCH/PUT /admin/notes/1.json
  def update
    respond_to do |format|
      if @note.update(admin_note_params)
        format.html { redirect_to admin_blog_city_notes_url, notice: 'note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/notes/1
  # DELETE /admin/notes/1.json
  def destroy
    respond_to do |format|
      if @note.update(status: "disabled")
        format.html { redirect_to admin_blog_city_notes_url, notice: 'note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def enable
    respond_to do |format|
      if @note.update(status: "enabled")
        format.html { redirect_to admin_blog_city_notes_url, notice: 'note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_note
    @note = Note.find_by_slug(params[:id])
  end
  
  def set_admin_blog
    @blog = Blog.find_by_slug params[:blog_city_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_note_params
    params.fetch(:note).permit!
  end
end
