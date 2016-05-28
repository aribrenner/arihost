class Pixel < ActiveRecord::Base

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

  private

  def set_short_url
    random_string = ''
    SHORT_URL_LENGTH.times do
      random_string += (accepted_chars.sample)
    end

    set_short_url if Pixel.find_by_short_url(random_string)

    self.short_url = random_string
  end

  def accepted_chars
    ('a'..'z').to_a +
    ('z'..'Z').to_a +
    ('0'..'9').to_a
  end

end
