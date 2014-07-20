class CraigslistResult
  attr_accessor :html, :url, :fetched_show_page
  attr_reader :search, :root_cl

  def initialize(row, search, root_cl)
    @html = row
    @search = search
    @root_cl = root_cl
    @url = root_cl + page_href
    @fetched_show_page = open_page(url)
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

  def url
    @url = @root_cl + @page_href
  end

  # ========================== Show-page-specific info==========================

  def open_page(link)
    RestClient.get(link)
  end

  def body
    @body = Nokogiri::HTML(@fetched_show_page).css('section#postingbody').text
  end

  def gmaps_url
    if Nokogiri::HTML(@fetched_show_page).css('p.mapaddress small a').first
      @gmaps_url = Nokogiri::HTML(@fetched_show_page).css(
      'p.mapaddress small a').first['href']
    end
  end
end
