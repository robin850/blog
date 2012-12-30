# encoding: utf-8
class Comment < ActiveRecord::Base
  attr_accessible :body, :author, :email, :admin
  belongs_to :article

  def admin?
    (self.admin == true) ? true : false
  end

  validates :body, :presence => true, :message => "Vous devez spécifier un message."
  validates :author, :presence => true, :message => "Vous devez renseigner votre nom."
  validates :email, :presence => true, :message => "Vous devez spéicifier votre e-mail."
end
