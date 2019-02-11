class SoNavy::CLI 
  
  attr_reader :type
  
  def start 
    puts "\n \n      Welcome to so_navy!".colorize(:yellow) #instance method
    menu
  end
  
  def menu
      
    puts "\n Which category would you like to shop?"
    puts ""
    puts "1".colorize(:yellow)  +" - Designer clothing"
    puts "\n2".colorize(:yellow)+" - Designer Accesories"
    puts "\n3".colorize(:yellow)+" - Beauty"
    puts "\n4".colorize(:yellow)+" - to Exit"
    puts ""
    input = gets.strip.to_i 
    case input
       when 1
         puts "\n            You chose Designer Clothing".colorize(:blue)
         puts ""
  
        # Scrapping Designer Clothing category
        
        @type = "clothing"
        if SoNavy::Category.type(@type) == []
          scrape_categories
        end
        list_categories
        choose_category
      
   
     when 2
         puts "\n            You chose Designer Accesories".colorize(:blue)
         puts ""
         # Scrapping Designer Accesories category
        
        @type = "accessories"
        if Dealio::Category.type(@type) == []
          scrape_categories
        end
        list_categories
        choose_category

          
       when 3
         puts "\n            You chose Beauty".colorize(:blue)
         puts ""
         # Scrapping Beauty category
        
        @type = "beauty"
        if Dealio::Category.type(@type) == []
          scrape_categories
        end
        list_categories
        choose_category
          
       when 4
          puts "Thanks for stopping by!"
    else 
      
      puts "\nPlease enter numbers 1 through 4".colorize(:red)
      menu # recursion
      
    end
  end 
  
  def list_categories
    SoNavy::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
     end
  end
  
  
  def choose_category
    puts "\nChoose a category by selecting a number:".colorize(:light_blue)
    input = gets.strip.to_i
    max_value = SoNavy::Category.type(@type).length
    if input.between?(1,max_value)
      category = SoNavy::Category.type(@type)[input-1]
      display_category_items(category)
    else
      puts "\nPlease put in a valid input".colorize(:red)
      list_categories
      choose_category
    end
  end
  
  
  
  def display_category_items(category)
     
    # Making sure to scrape only once
     
     if category.description == [] 
        SoNavy::Scraper.scrape_items(category)
     end  
     
     if category.items == []
       puts "Sorry no inventory!"
     else
     
       puts "\n       Here are the items for ".colorize(:red)+"#{category.name}:\n".colorize(:blue)
       category.items.each.with_index(1) do |item, index|   #represents an array of item objects
          #print out info about each item
          puts "\n#{index}. #{item.product}".colorize(:light_blue)
          puts item.description
      end
      puts "\n       That's all for this weeks'  ".colorize(:yellow)+"#{category.name}!\n".colorize(:light_blue)
    end
     second_menu
  end
  

  
  def scrape_categories
      categories =  SoNavy::Scraper.scrape_categories(@type)
  end
  
  

  
  def second_menu
    puts "\n       Would you like to:".colorize(:red)
    puts""
    puts "'C'".colorize(:blue) + " - look at another " + "Category?".colorize(:light_blue)
    puts "'S'".colorize(:blue) + " - go back to  " +"Start?".colorize(:light_blue)
    puts "'E'".colorize(:blue) + " - Exit? ".colorize(:light_blue)
    puts ""
    input = gets.strip.upcase
    if input == "C"
      list_categories
      choose_category
    elsif input == "S"
      menu
    elsif input == "E"
    
      puts "\nThanks for shopping with "+"So_Navy!".colorize(:light_blue)
      puts "           Goodbye!".colorize(:yellow)
    else
      puts "Sorry I couldn't understand that command"
      second_menu
    end
  end
  
end