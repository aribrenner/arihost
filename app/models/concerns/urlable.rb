module Urlable

  def set_short_url
    random_string = ''
    self.class::SHORT_URL_LENGTH.times do
      random_string += (accepted_chars.sample)
    end

    set_short_url if self.class.find_by_short_url(random_string)

    self.short_url = random_string
  end

  def accepted_chars
    ('a'..'z').to_a +
    ('A'..'Z').to_a +
    ('0'..'9').to_a
  end

end
