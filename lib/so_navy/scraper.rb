class SoNavy::Scraper
  
  
  def self.scrape_categories(url)
    
    # puts "Made it to scraper"
    webpage = Nokogiri::HTML(open(url))
    # webpage.css("div.content  h2  a")[3].text
    binding.pry
  end
end
