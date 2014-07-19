class CraigslistResult
  attr_accessor :html
  attr_reader :search

  def initialize(row, search)
    @html = row
    @search = search
  end

  def title
    @title = html.css('span.pl a').text.capitalize
  end

  def price
    # Pull out price and remove dollar sign
    @price = html.css('span.l2 span.price').text[1..-1].to_i
  end

  def location
    @location = html.css('span.pnr small').text.capitalize
    # Remove parens from location
    @location = @location[2..-2].capitalize if @location[2..-2]
  end

  def date
    @date = html.css('span.date').text
    # Convert date format (on page) into Date object
    @date = Date.parse(Chronic.parse(@date).to_s)
  end

  def page_href
    # Pull href out of title
    @page_href = html.css('span.pl a').first['href']
  end

  def open_page(url)
    RestClient.get(url)
  end
end
