class Image < ActiveRecord::Base
  validates :post, presence: true
  validates :img_url, presence: true

  belongs_to :post
end
