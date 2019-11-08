class Owner
    
  attr_reader :name, :species
    
  @@all = []
    
  def initialize(name = "", species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
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
      cat.owner == self
    end
  end
  
  def dogs 
    Dog.all.select do |dog|
      dog.owner == self 
    end
  end
  
  
  def buy_cat(sale_cat_name)
    new_cat = Cat.new(sale_cat_name)
    new_cat.owner = self
  end
  
  def buy_dog(sale_dog_name)
    new_dog = Dog.new(sale_dog_name)
    new_dog.owner = self
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
    self.cats do |cat|
      cat.mood = "nervous"
      cat.owner = nil 
    end
    self.dogs do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end
  end
  
  def list_pets
    total_pets = []
    Cat.all.each do |cat|
      if cat.owner == self
        total_pets << cat
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        total_pets << dog
      end
    end
    total_pets
  end
  
end