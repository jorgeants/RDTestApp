class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  COOKIE_NAME = '_rdtestapp.cookie'

  def cookie
    response.set_cookie(COOKIE_NAME, cookie_data)
    respond_to do |format|
      format.html
      format.json { render json: cookie_data}
    end
  end

  def cookie_data
    @cookie ||= request.cookies[COOKIE_NAME] || create_cookie
  end

  def create_cookie
    key = SecureRandom.uuid
    @contact = Contact.new
    @contact.key = key
    if @contact.save
      @contact.to_json
    end
  end

  def access
    @contact = Contact.find_by_key(params[:key])
    @access = Access.new
    @access.url = params[:url]
    @access.key = params[:key]
    @access.contact = @contact
    @access.save
  end

  def save_contact
    @contact = Contact.find_by_key(params[:key])
    @contact.update(email: params[:email])
  end

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :key)
    end
end
