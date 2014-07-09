class Search < ActiveRecord::Base
  validates :query, presence: true
  validates :location, presence: true

  belongs_to :user
  
  CITIES = {
    "Boston" => "bos"
    }



  CITIES["Boston"]
end
