class ContactsController < ApplicationController
  def contacts_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
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
        flash.keep
        redirect_to session.delete(:return_to)
      else
        flash[:contact_errors] = @contact.errors.full_messages
        flash[:contact_errors].keep_if
        flash.now[:warning] = 'Cannot send message.'
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
