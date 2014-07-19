class Post < ActiveRecord::Base
  belongs_to :search

  validates :search, presence: true
  validates :title, presence: true, uniqueness: true
  validates :page_href, presence: true
  validates :url, presence: true

  def self.find_or_create_from_craigslist_result(result)
    if Post.find_by(page_href: result.page_href)
      Post.update(
        search: result.search, title: result.title, price: result.price,
        location: result.location, date: result.date,
        page_href: result.page_href
        )
    else
      Post.create(
        search: result.search, title: result.title, price: result.price,
        location: result.location, date: result.date,
        page_href: result.page_href
        )
    end
  end
end
