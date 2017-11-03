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
      @contact.request = request
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message!'
        redirect_to session.delete[:return_to]
        flash.keep
      else
        flash[:contact_errors] = @contact.errors.full_messages
        flash.now[:error] = 'Cannot send message.'
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
