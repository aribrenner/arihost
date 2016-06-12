module Urlable

  RESERVED = %w(http app api images)

  def set_short_url
    random_string = ''
    self.class::SHORT_URL_LENGTH.times do
      random_string += (accepted_chars.sample)
    end

    set_short_url unless valid_url?(random_string)

    self.short_url = random_string
  end

  def accepted_chars
    ('a'..'z').to_a +
    ('A'..'Z').to_a +
    ('0'..'9').to_a
  end

  def valid_url?(random_string)
    downcased = random_string.downcase
    !RESERVED.any? { |r| downcased.start_with?(r) } &&
    !self.class.exists?(short_url: random_string)
  end

end
