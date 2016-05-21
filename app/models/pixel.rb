class Pixel < ActiveRecord::Base

  validates_presence_of :short_url, :user

end
