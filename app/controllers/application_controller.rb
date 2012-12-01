# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
    flash[:alert] = "Vous n'avez pas le droit de voir cette page."
  end
end
