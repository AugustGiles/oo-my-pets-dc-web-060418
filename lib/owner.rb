require 'pry'
class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets


  def initialize(species)
    @@all << self
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |pet, pet_array|
      pet_array.each do |specific_pet|
        specific_pet.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    dog_array_length = 0
    cat_array_length = 0
    fish_array_length = 0
    pets.each do |pet, pet_array|
      if pet == :dogs
        dog_array_length = pet_array.length
      elsif pet == :cats
        cat_array_length = pet_array.length
      elsif pet == :fishes
        fish_array_length = pet_array.length
      end
    end
    "I have #{fish_array_length} fish, #{dog_array_length} dog(s), and #{cat_array_length} cat(s)."
  end

end
