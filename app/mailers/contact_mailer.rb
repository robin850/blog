# encoding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "robin.dupret@gmail.com"

  def notification(message)
    @message = message
    mail to: "robin.dupret@gmail.com",
         subject: "[Contact] #{@message.name} a essayé de vous contacter"
  end
end
