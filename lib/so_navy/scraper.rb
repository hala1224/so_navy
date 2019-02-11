class SoNavy::Scraper
  
  def self.scrape_categories(type)
    #open the url and scrape all the categories
  
    url = "https://somethingnavy.com/shop/category/#{type}"
    webpage = Nokogiri::HTML(open(url))
    # section = webpage.css("div.more div.dd-inner")
    # array_of_links = section.css("a")
     
    index = 0 
    if type === "clothing" then 
      index=2
    end
    if type ==="accessories" then
      index=5
    end
     
    # direct link 
    array_of_links = webpage.css("div.shop-nav > div > nav:nth-child(#{index}) > span:nth-child(#{index}) > div > div > a")
     
    array_of_links.map do |link|
     SoNavy::Category.new(link.text.delete!("\n\t"), link.attributes["href"].value, type)
    end
    #return value will now be an array of objects
  end
  
#   array=page.css("div.shop-product h3") #designer
# array1=page.css("div.shop-product h2 a") #"description"
# array3=page.css("div.shop-product h3  a") #links
  
  
  
  
  
  def self.scrape_items(category)
    puts "In scrape url is #{category.url}"
    webpage = Nokogiri::HTML(open(category.url))
    items = webpage.css("div.shop-product")
    
    # Grabing first 5 elements on the page since 6-12 are not items

  

    items.each do |card|
    
                 # Making sure no blanks or new line
                 
        # if !card.css("h2").nil? && !card.css("h2").text.include?("\n\t")
          
              #creating an instance
              item = SoNavy::Item.new
              
              #   2nd level scrape
          
        
                  item.product = card.css(" h3").text.delete!("        \n\t")
                  item.description = card.css(" h2 a").text.delete!("\n\t")
                  # item.link = card.css(" h3 a").attributes["href"].value

              
               
            #   #Associated Objects
                   
                    category.add_item(item)
                   
      
           
            # end
      end
       
  end
end
