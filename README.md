# 📚 ruby-scraper

A simple Ruby CLI web scraper that extracts book titles and prices from [books.toscrape.com](https://books.toscrape.com), and exports the results to CSV, JSON, or TXT.

---

## 🚀 Features

- Scrape multiple pages from `books.toscrape.com`
- Export results to:
  - `books.csv`
  - `books.json`
  - `books.txt`
- Modular CLI architecture (`ScraperCLI`, `BookScraper`, `Exporter`)
- Lightweight: only uses `nokogiri` gem

---

## 🛠 Requirements

- Ruby 3+
- Bundler (`gem install bundler` if needed)

---

## 📦 Setup

Clone the repo and install dependencies:

```bash
git clone https://github.com/farz-bhullar/ruby-scraper.git
cd ruby-scraper
bundle install
```

## Usage

```bash
ruby scraper.rb <url> <page_limit> [format: csv|json|txt]
```

- `<url>`: URL to scrape (e.g. `https://books.toscrape.com`)
- `<page_limit>`: Number of pages to scrape
- `[format]`: Output format (optional)

## Examples

```bash
# Scrape 5 pages from books.toscrape.com and print to console
ruby scraper.rb https://books.toscrape.com 5

# Scrape 10 pages from books.toscrape.com and save as books.csv
ruby scraper.rb https://books.toscrape.com 10 csv

# Scrape 20 pages from books.toscrape.com and save as books.json
ruby scraper.rb https://books.toscrape.com 20 json

# Scrape 30 pages from books.toscrape.com and save as books.txt
ruby scraper.rb https://books.toscrape.com 30 txt
```

## Learning Objectives

- Web scraping with Nokogiri
- Command-line interface (CLI) development
- File I/O and data export
- Modular code organization
- Error handling and user feedback