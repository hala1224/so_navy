class SoNavy::Scraper
  
  
  def self.scrape_categories(url)
    
    # puts "Made it to scraper"
    webpage = Nokogiri::HTML(open(url))
     array_of_links = webpage.css("div.content  h2  a")
     
    # .text.delete!("\n\t") deletes the blank spaces and new line 
    
    
     array_of_links.each.map do |link|
    
       SoNavy::Category.new(link.text.delete!("\n\t"), link.attributes["href"].value)
     end  
    # return value is array of objects containing category name and url
  end
  
  
  
  def self.scrape_items(category)
    
    webpage = Nokogiri::HTML(open(category.url))
    items = webpage.css(".content")
    
    # first element on the page is not a sweater
    items.shift()
    puts "in self scrape"
    puts items.length
    
    
    # items.each.with_index(1) do |card, index|
    
    i=0
    items.each do |card|
    
    # added
     if !card.css("h2").text.include?("\n")
        #   #creating an instance
           item = SoNavy::Item.new
          
        #   #   2nd level scrape
      
    
              item.product = card.css(" h2").text
              item.description = card.css("p").text
    
          
            # if !item.product.include?("\n\t")  then
               #   #Associated Objects
               
                 category.add_item(item)
               
                # puts "in if #{item.product}, #{item.description}"
                 i=i+1
       
        end
    end
    
    
  end
end
# def self.scrape_items(category)
#     webpage = Nokogiri::HTML(open(category.url))
#     items = webpage.css("div.row div.col.information")
#     items.each do |card|
#       #creating an instance
#       deal = Dealio::Deal.new

#       name_and_price = card.css("a.go-link").text.split("$")

#       #Assigning object attributes
#       deal.description = card.css("p").text
#       deal.product = name_and_price[0]
#       deal.price = name_and_price[1]

#       #Associated Objects
#       category.add_deal(deal)

#     end
#   end
