# encoding: utf-8
class Comment < ActiveRecord::Base
  attr_accessible :body, :author, :email, :admin
  belongs_to :article

  default_scope order("created_at asc")

  def admin?
    (self.admin == true) ? true : false
  end

  validates_presence_of :body, message: "Vous devez spécifier un message."
  validates_presence_of :author, message: "Vous devez renseigner votre nom."
  validates_presence_of :email, message: "Vous devez spéicifier votre e-mail."
end
