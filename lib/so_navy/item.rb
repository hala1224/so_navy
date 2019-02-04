class SoNavy::Item
  attr_accessor :product, :description, :link, :category
  @@all = []

  
  # def initialize(product, description)
  #   @product=product
  #   @description=description
  #   # @url=url
  #   @products=[]
  #   @@all << self    
  # end  
  
  
  
  def self.all
     @@all
   end
  
  # def add_product(product)
  #   self.products << product
  #   product.item = self
  # end




end