class InfoController < ApplicationController

  def about
  end

  def cgu
  end

  def contact
    @message = Message.new
    if request.post?
      @message = Message.new(params[:message])
      if @message.valid?
        ContactMailer.notification(@message).deliver
      else
        render :contact
      end
    end
  end

end