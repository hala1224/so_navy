class SoNavy::Scraper
  
  def self.scrape_categories(type)
    #open the url and scrape all the categories
  
    url = "https://somethingnavy.com/shop/category/#{type}"
    webpage = Nokogiri::HTML(open(url))
    # section = webpage.css("div.more div.dd-inner")
    # array_of_links = section.css("a")
     
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
     
    # array=page.css("div.shop-nav > div > nav:nth-child(2) > span:nth-child(5) > div > div a")
    # direct link 
    array_of_links = webpage.css("div.shop-nav > div > nav:nth-child(#{index1}) > span:nth-child(#{index2}) > div > div > a")
                                  
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
    
    
    
    # puts "In 2nd scrape  is #{items.css(".placeholder").text}"
  
    items.each do |card|
    
                 # Making sure no blanks or new line
                 
        # if !card.css("h3").nil? && !card.css("h2 a").nil? then
        
              #creating an instance
              item = SoNavy::Item.new
              
              #   2nd level scrape
          
          
                  item.product = card.css("h3").text.delete!("        \n\t")
                  item.description = card.css("h2 a").text.delete!("\n\t")
                  # item.link = card.css(" h3 a").attributes["href"].value

              
               
            #   #Associated Objects
         
                   if !item.product.nil? then
                    category.add_item(item)
                   end
      
           
            # end
      end
       
  end
end
