require 'nokogiri'
require 'open-uri'

class BookScraper
  def initialize(base_url)
    @base_url = base_url
    @books = []
  end

  def scrape(page_limit)
    (1..page_limit.to_i).each do |page_number|
      target_url = build_page_url(page_number)
      begin
        html = URI.open(target_url)
      rescue OpenURI::HTTPError => e
        puts "✅ No more pages. Stopped at page #{page_number}."
        break
      end

      doc = Nokogiri::HTML(html)
      @books += scrape_page(doc)
    end

    @books
  end

  private

  def scrape_page(doc)
    doc.css('.product_pod').map do |book|
      title = book.at_css('h3 a')['title']
      price = book.at_css('.price_color')&.text
      { title: title, price: price }
    end
  end

  def build_page_url(page_number)
    "#{@base_url}/catalogue/page-#{page_number}.html"
  end

end
