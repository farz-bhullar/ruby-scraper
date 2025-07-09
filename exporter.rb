require 'csv'
require 'json'

class Exporter
  def self.export(format, books)
    case format
    when 'csv'
      export_csv(books)
    when 'json'
      export_json(books)
    when 'txt'
      export_txt(books)
    else
      puts "⚠️ Unsupported export format: #{format}"
    end
  end

  def self.export_csv(books)
    CSV.open("books.csv", "w") do |csv|
      csv << ["Title", "Price"]
      books.each { |book| csv << [book[:title], book[:price]] }
    end
    puts "\n✅ Exported #{books.size} books to books.csv"
  end

  def self.export_json(books)
    File.write("books.json", JSON.pretty_generate(books))
    puts "\n✅ Exported #{books.size} books to books.json"
  end

  def self.export_txt(books)
    File.open("books.txt", "w") do |file|
      books.each_with_index do |book, index|
        file.puts "#{index + 1}. #{book[:title]} - #{book[:price]}"
      end
    end
    puts "\n✅ Exported #{books.size} books to books.txt"
  end
end
