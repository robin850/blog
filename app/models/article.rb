# encoding: utf-8
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug

  attr_accessible :body, :description, :introduction, :title, :published, :category_ids, :slug, :further

  default_scope order("created_at DESC")

  has_and_belongs_to_many :categories
  has_many :comments

  scope :published, where(:published => :on)
  scope :unpublished, where(:published => :off)

  validates :body, :title, :presence => true

  self.per_page = 10

  def published?
    self.published == "on" ? true : false
  end

  def self.search(params)
    if params[:query]
      where("title LIKE :q OR body LIKE :q OR introduction LIKE :q AND published = 'on'", {:q => "%#{params[:query]}%"}).page(params[:page])
    else
      published.page(params[:page])
    end
  end

  def self.further?
    self.further.present?
  end
end
