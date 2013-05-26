# encoding: utf-8
class InfoController < ApplicationController
  def cgu
  end

  def contact
    @message = Message.new
    if request.post?
      @message = Message.new(params[:message])
      if @message.valid?
        ContactMailer.notification(@message).deliver
        flash[:notice] = "Merci, votre message a été envoyé !"
        redirect_to contact_path
      else
        render :contact
      end
    end
  end
end
