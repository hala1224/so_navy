class SoNavy::Category
  attr_accessor :name, :url, :items
  # attr_reader :items
    
    
  @@all=[]
  def initialize(name, url)
    @name=name
    @url=url
      # @url="https://somethingnavy.com/" + url
    @items=[]
    @@all << self    
  end  
  
  
  
  def self.all
    @@all
  end
  
  def add_item(item)
    self.items << item
    item.category = self
  end
  
end