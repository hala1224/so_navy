class SoNavy::CLI 
  
  
  def start 
    puts "\n \n      Welcome to so_navy!" #instance method
    puts "\n Which category would you like to see?"
    puts ""
    puts "1 - Something Navy \n2 - Fashion \n3 - Something else \n4 - to Exit"
    input = gets.strip.to_i 
    case input
       when 1
         puts "You chose Something Navy"
        # Scrapping the Something Navy category
         url = "https://somethingnavy.com/category/something-navy/"
        SoNavy::Scraper.scrape_categories(url)
       when 2
          puts "You chose Fashion"
       when 3
          puts "You chose Something else"
       when 4
          puts "Thanks for stopping by!"
    else 
      
      puts "Please enter numbers 1 through 4"
    end
  end  
end