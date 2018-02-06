class Pixel < ActiveRecord::Base

  include Urlable

  validates_presence_of :user, :name

  has_many :hits, as: :hittable, dependent: :destroy
  belongs_to :user

  SHORT_URL_LENGTH = 8

  def full_url
    "#{ENV['DOMAIN']}/images/#{short_url}"
  end

  def image_tag
    "<img src='http://#{full_url}'>"
  end

end
