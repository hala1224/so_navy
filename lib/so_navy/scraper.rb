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
    
    # Grabing first 5 elements on the page since 6-12 are not items

    new_items=[]
    new_items=items[1..5]

    new_items.each do |card|
    
                 # Making sure no blanks or new line
                 
        if !card.css("h2").nil? && !card.css("h2").text.include?("\n\t")
          
              #creating an instance
              item = SoNavy::Item.new
              
              #   2nd level scrape
          
        
                  item.product = card.css(" h2").text
                  item.description = card.css("p").text
        
              
          
            #   #Associated Objects
                   
                    category.add_item(item)
                   
      
           
            end
      end
       
  end
end
