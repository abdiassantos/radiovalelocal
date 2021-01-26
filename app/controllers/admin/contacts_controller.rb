# frozen_string_literal: true

class Admin::ContactsController < AdminController
  before_action :set_admin_contact, only: %i[show edit update destroy]

  # GET /admin/contacts
  # GET /admin/contacts.json
  def index
    @q = Contact.ransack(params[:q])
    @q.sorts = 'created_at asc' if @q.sorts.empty?
    @contacts = @q.result.page(params[:pagina])
  end

  # GET /admin/contacts/1
  # GET /admin/contacts/1.json
  def show; end

  # GET /admin/contacts/new
  def new
    @contact = Contact.new
  end

  # GET /admin/contacts/1/edit
  def edit; end

  # POST /admin/contacts
  # POST /admin/contacts.json
  def create
    @contact = Contact.new(admin_contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to admin_contacts_url, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contacts/1
  # PATCH/PUT /admin/contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(admin_contact_params)
        format.html { redirect_to admin_contacts_url, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contacts/1
  # DELETE /admin/contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_contact_params
    params.require(:contact).permit!
  end
end
