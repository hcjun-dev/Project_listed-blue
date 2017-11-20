class ContactsController < ApplicationController

  def contacts_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end

  # This allows only users that are signed in the ability to contact people
  before_filter :correct_user?, :only =>[:create]
  def correct_user?
    if current_user
      # Do the conttroller action
    else
      flash[:notice] = "You must login to contact."
      send_back
    end
  end

  def new
    @contact = Contact.new
    session[:return_to] = request.referer
  end

  def create
    begin
      @contact = Contact.new(contacts_params)
      # Gets the needed information from the listing
      @item = Item.find(session[:item_id])
      @contact.item_title = @item.title
      @contact.item_email = @item.contact
      # Attempts to send the message
      @contact.request = request
      if @item.contact && @contact.deliver
        session.delete(:item_id)
        flash.now[:notice] = 'Thank you for your message!'
        send_back
      else
        flash[:contact_errors] = @contact.errors.full_messages
        flash.now[:notice] = "There is no contact available ." if !@item.contact
        flash.now[:warning] = 'Cannot send message.'
        render :new
      end
    rescue ScriptError
      flash[:warning] = 'Sorry, this message appears to be spam and was not delivered.'
      send_back
    end
  end
  
  # Sends user/guest back to the original item listing
  private
  def send_back
    flash.keep
    redirect_to session.delete(:return_to)
  end
  
end