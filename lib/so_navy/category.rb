class SoNavy::Category
  attr_accessor :name, :url, :type
  attr_reader :items
    
    
  @@all=[]
  def initialize(name, url, type)
    @name=name
    # @url=url
    @url="https://somethingnavy.com/shop" + url
    @items=[]
    @@all << self    #saving or remembering the object
  end  
  

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