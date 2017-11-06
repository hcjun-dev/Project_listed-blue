class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true
  attr_writer :item_title
  attr_writer :item_email

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => @item_title.to_s,
      :to => @item_email.to_s,
      :from => %("#{name}" <#{email}>)
    }
  end
end