class ContactMailer < ApplicationMailer
  default :from => 'rangel.soares.souza@gmail.com'

  def contact_message(user)
    @contact = user
    mail(:to => @contact.email, :subject => @contact.name+' Sua palavra foi encontrada com sucesso')
  end
end
