require 'open-uri'

class CraigslistResult
  attr_accessor :html, :url, :fetched_show_page
  attr_reader :search, :root_cl

  def initialize(row, search, root_cl)
    @html = row
    @search = search
    @root_cl = root_cl
    @url = root_cl + page_href
    @fetched_show_page = open_page(@url)
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
    Nokogiri::HTML(open(link))
  end

  def body
    @body = @fetched_show_page.css('section#postingbody').text.strip
  end

  def latitude
    if @fetched_show_page.css('div#map').first
      @latitude = @fetched_show_page.css('div#map').first['data-latitude'].to_f
    end
  end

  def longitude
    if @fetched_show_page.css('div#map').first
      @longitude = @fetched_show_page.css('div#map').first['data-longitude'].to_f
    end
  end

  def imgs
    if @fetched_show_page.css('div#thumbs a').first
      @imgs = []
      @fetched_show_page.css('div#thumbs a').each do |pic|
        @imgs << pic['href']
      end
      @imgs
    end
  end
end
