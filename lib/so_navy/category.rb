class SoNavy::Category
  attr_accessor :name, :url, :type
  attr_reader :items
    
    
  @@all=[]
  def initialize(name, url, type)
    @name=name
    @url=url
    @type=type
    @items=[]
    @@all << self    #saving or remembering the object
  end  
  
  puts "In category the url is #{@url}"
  def self.all
    @@all
  end

  def self.type(type)
    @@all.select{|category| category.type == type}
  end

  
  def add_item(item)
    self.items << item
    item.category = self
  end
  
end

# class Dealio::Category
#   attr_accessor :name, :url, :type 
#   attr_reader :deals  #has_many relationship
#   @@all = []
#   def initialize(name, url, type)
#     @name = name
#     @url =  "https://www.bradsdeals.com" + url
#     @type = type
#     @deals = []
#     @@all << self #saving or remembering the object
#   end

#   def self.all
#     @@all
#   end
  
#   def self.type(type)
#     @@all.select{|category| category.type == type}
#   end



#   def add_deal(deal)
#     self.deals << deal
#     deal.category = self
#   end
# end