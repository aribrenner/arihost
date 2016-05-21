class Pixel < ActiveRecord::Base

  validates_presence_of :short_url, :user

  has_many :hits, as: :hitable
  belongs_to :user

end
