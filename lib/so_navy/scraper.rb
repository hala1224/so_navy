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
  
  
  
  def self.scrape_items(category)
    puts "In Scrapper"
    puts category.url
    webpage = Nokogiri::HTML(open(category.url))
    binding.pry
    items = webpage.css("div.row div.col.information")
    items.each do |card|
      #creating an instance
      item = SoNavy::Item.new

      # name_and_price = card.css("a.go-link").text.split("$")
      #   name = webpage.css(".content h2")[1].text
      #   description = webpage.css(".content p")[1].text

      #Assigning object attributes
      # item.description = card.css("p").text
      # deal.product = name_and_price[0]
      # deal.price = name_and_price[1]

      #Associated Objects
      category.add_item(item)

    end
  end
end
