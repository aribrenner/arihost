class Node < ActiveRecord::Base

  include Urlable

  validates_presence_of :redirect_url

  belongs_to :user
  has_many :hits, as: :hittable, dependent: :destroy

  SHORT_URL_LENGTH = 6

  def full_url
    "#{ENV['DOMAIN']}/#{short_url}"
  end

  def redirect_url_with_scheme
    return redirect_url if URI.parse(redirect_url).scheme
    'http://' + redirect_url
  end

end
