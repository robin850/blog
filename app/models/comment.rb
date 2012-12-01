# encoding: utf-8
class Comment < ActiveRecord::Base
  attr_accessible :body, :author, :email, :admin
  belongs_to :article

  def admin?
    (self.admin == true) ? true : false
  end
end
