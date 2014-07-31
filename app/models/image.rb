class Image < ActiveRecord::Base
  validates :post, presence: true
  validates :img_url, presence: true,
            format: { with: /\Ahttp:\/\/images.craigslist.org\/\w*_\d*x\d*\.jpg\z/ }

  belongs_to :post
end
