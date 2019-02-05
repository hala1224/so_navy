class SoNavy::CLI 
  
  
  def start 
    puts "\n \n      Welcome to so_navy!" #instance method
    menu
  end
  
  def menu
      
    puts "\n Which category would you like to see?"
    puts ""
    puts "1 - Something Navy \n2 - Fashion \n3 - Something else \n4 - to Exit"
    input = gets.strip.to_i 
    case input
       when 1
         puts "You chose Something Navy"
        # Scrapping the Something Navy category
        # url = "https://somethingnavy.com/category/something-navy/"
        # categories = SoNavy::Scraper.scrape_categories(url)
        
        # scrape Something Navy category
        scrape_somenavy
        list_categories
        choose_category
        
        # puts categories[0].name
        # puts categories[0].url
   
   e    when 2
          puts "You chose Fashion"
          # scrape Fashion category
          scrape_fashion
          list_categories
          choose_category
          
          
       when 3
          puts "You chose Something else"
          
          scrape_somelse
          list_categories
          choose_category
          
          
       when 4
          puts "Thanks for stopping by!"
    else 
      
      puts "Please enter numbers 1 through 4"
    end
  end 
  
  def list_categories
    SoNavy::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
     end
  end
  
  def choose_category
    puts "\nChoose a category by selecting a number:"
    input = gets.strip.to_i
    max_value = SoNavy::Category.all.length
    if input.between?(1,max_value)
  
      category = SoNavy::Category.all[input-1]
      puts "In choose_category"
      display_category_items(category)
    else
      puts "\nPlease put in a valid input"
      list_categories
      choose_category
    end
    
   
  end
  
  
   def display_category_items(category)
     
    # puts "In display and category is" 
    # puts category.url
     SoNavy::Scraper.scrape_items(category)
     puts "Here are the items for #{category.name}:\n"
     
    puts " In display_category length #{category.items.length}"
     category.items.each.with_index(1) do |item, index|   #represents an array of item objects
        #print out info about each item
        puts "\n#{index}. #{item.product}"
        puts item.description
    end
    second_menu
  end
  
   def scrape_somenavy
      url = "https://somethingnavy.com/category/something-navy/"
      categories =  SoNavy::Scraper.scrape_categories(url)
  end
  
  def scrape_fashion
     url="https://somethingnavy.com/category/fashion/"
     categories =  SoNavy::Scraper.scrape_categories(url)
  end
  
  def scrape_somelse
    url="https://somethingnavy.com/category/something-else/"
    categories =  SoNavy::Scraper.scrape_categories(url)
  end
  
  def second_menu
    puts "Would you like to look at another category? Type 'C'"
    puts "Would you like to go to the start? Type 'S'"
    puts "Would you like to exit? Type 'E'"
    input = gets.strip.upcase
    if input == "C"
      list_categories
      choose_category
    elsif input == "S"
      menu
    elsif input == "E"
      puts "Goodbye!"
    else
      puts "Sorry I couldn't understand that command"
      second_menu
    end
  end
  
end