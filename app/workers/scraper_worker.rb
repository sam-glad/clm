class ScraperWorker
  include Sidekiq::Worker

  def build_search_url(search)
    root_cl = Search::CITIES[search.location][:url]
    short_category = Search::CATEGORIES[search.category][:short]
    short_query = search.query.gsub!(/\s+/, '+')
    short_search_url =
      "#{root_cl}/search/#{short_category}?query=#{short_query}"
    short_search_url += "&minAsk=#{search.min_price}" if search.min_price
    short_search_url += "&maxAsk=#{search.max_price}" if search.max_price
    short_search_url
  end

  def perform(search_id)
    search = Search.find(search_id)
    root_cl = Search::CITIES[search.location][:url]
    doc = Nokogiri::HTML(open(build_search_url(search)))
    results_count = 0

    doc.css('p.row').each do |row|
      # .text method removes HTML tags
      title = row.css('span.pl a').text
      title.capitalize! if title
      # Remove dollar sign so as to allow price to be saved as an integer
      price = row.css('span.l2 span.price').text[1..-1].to_i
      location = row.css('span.pnr small').text
      # Remove parens from location
      location = location[2..-2].capitalize if location[2..-2]
      date = row.css('span.date').text
      # Convert date format (on page) into Date object
      date = Date.parse(Chronic.parse(date).to_s)
      # Pull href out of title
      page_href = row.css('span.pl a').first['href']
      url = Nokogiri::HTML(open(root_cl + page_href))
      # Strip leading and trailing whitespace from body
      body = url.css('section#postingbody').text.strip!
      if url.css('p.mapaddress small a').first
        google_maps_url = url.css('p.mapaddress small a').first['href']
      end
      # Change url var from Nokogiri::HTML::Document to string to store in DB
      url = root_cl + page_href

      @new_post = Post.create({
        search: search, title: title, price: price,
        location: location, date: date, page_href: page_href, url: url,
        body: body, google_maps_url: google_maps_url
        })

      results_count += 1
      # Avoid sending an idententical number of get requests each time
      break if results_count == (rand(2..5))
      # Wait a random amount of time so they stop throttling me
      sleep(rand(13.0..29.0))
    end
  end
end
