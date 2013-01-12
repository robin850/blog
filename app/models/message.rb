# encoding: utf-8
class Message
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :message

  validates_presence_of :message, :message => "Vous devez renseigner un message"
  validates_presence_of :email, :message => "Vous devez renseigner un email"
  validates_presence_of :name, :message => "Vous devez renseigner votre nom"
end