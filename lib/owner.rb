class Owner
    
  attr_reader :name, :species
    
  @@all = []
    
  def initialize(name = "", species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    puts "#{@species}"
  end
  
  def self.all
    @@all 
  end
  
  def self.count
    @@all.size 
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner.name == self.name
    end
  end
  
  def buy_cat(sale_cat)
    Cat.all.each do |cat|
      if sale_cat.name == cat.name 
        cat.owner = self
      end
    end
  end
  
  def walk_dogs
    Dog.all.each do |dog|
      if dog.owner == self 
        dog.mood = "happy"
      end
    end
  end
  
  def feed_cats
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end
  
  def sell_pets
    if self.cats
  

end