class Post < ActiveRecord::Base
  belongs_to :search

  validates :search, presence: true
  validates :title, presence: true
  validates :page_href, presence: true
  validates :url, presence: true
end
