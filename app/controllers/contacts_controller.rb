class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Mensagem Enviada com sucesso' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :index }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit!
    end
end
