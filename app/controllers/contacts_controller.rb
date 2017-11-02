class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    session[:return_to] = request.referer
  end

  def create
    begin
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message!'
        redirect_to session[:return_to]
        flash.keep
      else
        flash.now[:error] = 'Cannot send message.'
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
