class SoNavy::Category
  attr_accessor :name, :url
  @@all=[]
  def initialize(name, url)
    @name=name
    @url="https://somethingnavy.com/" + url
    @@all << self    
  end  
  
  def self.all
    @@all
  end
end