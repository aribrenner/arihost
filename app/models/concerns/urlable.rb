module Urlable

  RESERVED = %w(http app api images)

  def set_short_url
    str = self.class::SHORT_URL_LENGTH.times.map { random_char }.join
    set_short_url unless valid_url?(str)
    self.short_url = str
  end

  def accepted_chars
    vowels = ['a', 'e', 'i', 'o', 'u']
    ('b'..'z').to_a +
    ('B'..'Z').to_a +
    ('0'..'9').to_a -
    vowels - vowels.map(&:upcase)
  end

  def random_char
    accepted_chars.sample
  end

  def valid_url?(random_string)
    downcased = random_string.downcase
    !RESERVED.any? { |r| downcased.start_with?(r) } &&
    !self.class.exists?(short_url: random_string)
  end

end
