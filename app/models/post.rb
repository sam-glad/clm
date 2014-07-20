class Post < ActiveRecord::Base
  belongs_to :search

  validates :search, presence: true
  validates :title, presence: true
  validates :page_href, presence: true, uniqueness: true
  validates :url, presence: true

  def self.find_or_create_from_craigslist_result(result)
    @post = Post.find_by(url: result.url)

    if @post.nil?
      @post = Post.create(
        search: result.search, url: result.url, title: result.title,
        price: result.price, location: result.location, date: result.date,
        page_href: result.page_href, body: result.body,
        google_maps_url: result.gmaps_url
        )
    else
      @post.update(
        search: result.search, url: result.url, title: result.title,
        price: result.price, location: result.location, date: result.date,
        page_href: result.page_href, body: result.body,
        google_maps_url: result.gmaps_url
        )
    end
  end
end
