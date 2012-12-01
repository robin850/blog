# encoding: utf-8
class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  
  attr_accessible :name, :slug
  has_and_belongs_to_many :articles
end
