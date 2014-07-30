class Post < ActiveRecord::Base
  belongs_to :search
  has_many :images

  validates :search, presence: true
  validates :title, presence: true
  validates :page_href, presence: true, uniqueness: true
  validates :page_href, format: { with: /\A\/\w{3}\/\w{3}\/\d{10}\.html\z/ }

  validates :url, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def self.find_or_create_from_craigslist_result(result)
    @post = Post.find_by(url: result.url)

    if @post.nil?
      @post = Post.create(
        search: result.search, url: result.url, title: result.title,
        price: result.price, location: result.location, date: result.date,
        page_href: result.page_href, body: result.body,
        latitude: result.latitude, longitude: result.longitude
        )
      result.imgs.each do |img|
        Image.create(post: @post, img_url: img)
      end
    else
      @post.update(
        search: result.search, url: result.url, title: result.title,
        price: result.price, location: result.location, date: result.date,
        page_href: result.page_href, body: result.body,
        latitude: result.latitude, longitude: result.longitude
        )
    end
  end
end
