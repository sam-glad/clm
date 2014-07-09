class Search < ActiveRecord::Base
  validates :query, presence: true
  validates :location, presence: true

  belongs_to :user

  # TODO fill this in with all CL cities; CITIES["Boston"] will return 'bos'
  # CITIES = {
  #   'Boston' => 'bos'
  #   }
end
