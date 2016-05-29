class Pixel < ActiveRecord::Base

  include Urlable

  validates_presence_of :short_url, :user, :name
  validates_uniqueness_of :short_url

  before_validation :set_short_url, on: :create

  has_many :hits, as: :hitable, dependent: :destroy
  belongs_to :user

  SHORT_URL_LENGTH = 8

  def full_url
    "#{ENV['DOMAIN']}/images/#{short_url}"
  end

  def image_tag
    "<img src='http://#{full_url}'>"
  end

end
