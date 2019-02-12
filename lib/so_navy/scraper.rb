class SoNavy::Scraper
  
  def self.scrape_categories(type)
    
    url = "https://somethingnavy.com/shop/category/#{type}"
    
   
    if type === "beauty" then
      # In Category Beauty no drop down window 
      # Initializing Category with url and type
      
        SoNavy::Category.new(type, url, type)
      
    else  
          #open the url and scrape all the categories
  
          webpage = Nokogiri::HTML(open(url))
          index1 = 0
          index2=0
          if type === "clothing" then 
            index1=2
            index2=2
          end
          if type === "accessories" then
            index1=2
            index2=5
          end
           
        
          # direct link 
          
          array_of_links = webpage.css("div.shop-nav > div > nav:nth-child(#{index1}) > span:nth-child(#{index2}) > div > div > a")
                                        
          array_of_links.map do |link|
           SoNavy::Category.new(link.text.delete!("\n\t"), link.attributes["href"].value, type)
          end
      end    
    #return value will now be an array of objects
  end
  
  
  
  
  def self.scrape_items(category)
    puts "In scrape url is #{category.url}"
  
    webpage = Nokogiri::HTML(open(category.url))
    items = webpage.css("div.shop-product")
    
  
    items.each do |card|
    
        
              #creating an instance
              item = SoNavy::Item.new
              
              #   2nd level scrape
          
          
                  item.product = card.css("h3").text.delete!("        \n\t") #designer
                  item.description = card.css("h2 a").text.delete!("\n\t")   #"description"
                  # item.link = card.css(" h3 a").attributes["href"].value   #links

              
               
            #   #Associated Objects
         
                   if !item.product.nil? then
                    category.add_item(item)
                   end
      
           
            # end
      end
       
  end
end
