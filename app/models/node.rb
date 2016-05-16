class Node < ActiveRecord::Base

  validates_presence_of :short_url, :redirect_url
  validates_uniqueness_of :short_url

end
