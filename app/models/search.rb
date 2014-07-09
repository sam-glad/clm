class Search < ActiveRecord::Base
  validates :query, presence: true
  validates :city_full, presence: true
  validates :city_short, presence: true

  belongs_to :user
end
