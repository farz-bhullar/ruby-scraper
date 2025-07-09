require_relative 'book_scraper'
require_relative 'exporter'

class ScraperCLI

  def initialize(args)
    @base_url = args[0]
    @page_limit = args[1]&.to_i
    @format = args[2]  # can be nil, "csv", "json", or "txt"
  end

  def run
    unless @base_url && @page_limit
      puts "❌ Usage: ruby scraper.rb <url> <page_limit> [format: csv|json|txt]"
      return
    end

    puts "🚀 Starting scrape from #{@base_url} (#{@page_limit} page#{@page_limit > 1 ? 's' : ''})..."

    scraper = BookScraper.new(@base_url)
    books = scraper.scrape(@page_limit)

    if %w[csv json txt].include?(@format)
      Exporter.export(@format, books)
    else
      print_books(books)
    end
  end

  private

  def print_books(books)
    puts "\n📚 Found #{books.size} books:\n\n"
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book[:title]} - #{book[:price]}"
    end
  end

end