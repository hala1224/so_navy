class SoNavy::Scraper
  
  
  def self.scrape_categories(url)
    
    # puts "Made it to scraper"
    webpage = Nokogiri::HTML(open(url))
     array_of_links = webpage.css("div.content  h2  a")
     
    # .text.delete!("\n\t") deletes the blank spaces and new line 
    
    
     array_of_links.each.map do |link|
      # binding.pry
       SoNavy::Category.new(link.text.delete!("\n\t"), link.attributes["href"].value)
     end  
    # return value is array of objects containing category name and url
  end
end
