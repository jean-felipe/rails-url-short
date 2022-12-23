class ShortUrlServices
  class << self
    ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

    def generate_title(original_url)
      response = HTTParty.get(original_url)
      parsed_html = Nokogiri::HTML.parse(response.body)
      parsed_html.title
    end

    def generate_short_url(id)
      return ALPHABET[0] if id.zero?

      s = ''
      base = ALPHABET.length
      while id > 0
        s << ALPHABET[id.modulo(base)]
        id /= base
      end
      s.reverse
    end
  end
end
