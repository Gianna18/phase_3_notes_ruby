An instance variable is responsible for holding information regarding an instance. It is a variable that is available in scope for all instance methods in the class.

A class variable is accessible to the entire class — it has class scope. A class method is a method that is called on the class itself, not on the instances of that class.

# Defining a Class Variable
# A class variable looks like this: @@variable_name. Just like an instance or a local variable, you can set it equal to any type of data.

# Let's create a class variable, @@album_count and set it equal to 0:

class Album

  @@album_count = 0

  def release_date=(date)
    @release_date = date
  end

  def release_date
    @release_date
  end
end

# Defining a Class Method
A class method is defined like this:

def self.class_method_name
  # some code
end

# Let's define a class method .count that returns the current count of albums.

class Album
  @@album_count = 0

  def self.count
    @@album_count
  end
end
Great, now if we call:

Album.count
It will return 0.


# Say you want to increment the album count by 1, here is what we'll be looking at 
class Album
  @@album_count = 0

  def initialize
    @@album_count += 1
  end

  def self.count
    @@album_count
  end
end

# We can access our class variables anywhere in our class: in both class and instance methods.

Album.new
Album.new
Album.new

Album.count
  # => 3

  #A class constant looks a bit different than a class variable. It's defined using all capital letters, like so:

class User
  ROLES = ["Admin", "Moderator", "Contributor"]
end

#Class constants
# Are defined in the body of the class
#Can be accessed from within a class method
#Can be accessed from within an instance method

# Example use of a class constant
class Album
  GENRES = ["Hip-Hop", "Pop", "Jazz"]

  @@album_count = 0

  def initialize(genre)
    if GENRES.include?(genre)
      @@album_count += 1
    end
  end

  def self.count
    @@album_count
  end
end

#Scope-wise, class constants can also be accessed from outside of the class using this syntax:

Album::GENRES
# => ["Hip-Hop", "Pop", "Jazz"]

class Bartender
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def intro
    "Hello, my name is #{self.name}!"
  end
end

phil = Bartender.new("Phil")
phil.intro
#=> "Hello, my name is Phil!"

class Bartender
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def intro
    "Hello, my name is #{self.name}!"
  end
end

#And class methods we call on the entire class itself, not the instance. Like if we had a method that kept track of all of the new instances of Bartender:
class Bartender
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def intro
    "Hello, my name is #{self.name}!"
  end
end