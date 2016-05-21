class Node < ActiveRecord::Base

  validates_presence_of :short_url, :redirect_url
  validates_uniqueness_of :short_url

  before_validation :set_short_url, on: :create

  belongs_to :user
  has_many :hits

  SHORT_URL_LENGTH = 6

  private

  def set_short_url
    random_string = ''
    SHORT_URL_LENGTH.times do
      random_string += (accepted_chars.sample)
    end

    set_short_url if Node.find_by_short_url(random_string)

    self.short_url = random_string
  end

  def accepted_chars
    ('a'..'z').to_a +
    ('z'..'Z').to_a +
    ('0'..'9').to_a
  end

end
