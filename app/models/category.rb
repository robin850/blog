class Category < ActiveRecord::Base
  validates :title, :slug, presence: true
end
