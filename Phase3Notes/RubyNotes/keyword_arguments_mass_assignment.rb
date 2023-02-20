#Keyword arguments are a special way of passing arguments into a method. They behave like hashes, pairing a key that functions as the parameter name, with its value. Let's walk through it together and refactor our happy_birthday method:

def happy_birthday(name: "Beyonce", current_age: 31)
    puts "Happy Birthday, #{name}"
    current_age += 1
    puts "You are now #{current_age} years old"
  end

  def happy_birthday(name:, current_age:)
    puts "Happy Birthday, #{name}"
    current_age += 1
    puts "You are now #{current_age} years old"
  end

  happy_birthday(current_age: 31, name: "Carmelo Anthony")
# Happy Birthday, Carmelo Anthony
# You are now 32 years old

#Mass assignment
# If data given in the method changes it affects how our program runs therefore we use mass assignment to combat the errors.
#Let's take a look at a code snippet:
class User
  attr_accessor :name, :age, :location, :user_name

  def initialize(user_name:, name:, age:, location:)
    @user_name = user_name
    @name = name
    @location = location
    @age = age
  end
end
Here we have our user class. It initializes with keyword arguments, i.e., a hash of attributes. For the purposes of this example, we won't get into the specifics of how we request and receive data from the Twitter API. Suffice to say that we send a request to the Twitter API and get a return value of a hash full of user attributes. For example:

twitter_user = { 
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  age: 26, 
  location: "NY, NY"
}
With what we've learned of mass assignment so far, we can use the twitter_user hash to instantiate a new instance of our own User class:

sophie = User.new(twitter_user)
# => #<User:0x007fa1293e68f0 @name="Sophie", @age=26, @user_name="sm_debenedetto", @location="NY, NY">
So far so good. But, what if Twitter changes their API without telling us? (How could they? Don't they know who we are?) After all, we are not in charge of Twitter or their API, they can do whatever they want, whenever they want, with no regard to our application which relies on their data. Let's say Twitter makes a change that we're unaware of. Now when we request data from their API, we get this return value:

new_twitter_user = {
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  location: "NY, NY"
}
Notice that the new_twitter_user no longer has an age. Let's see what happens if we try to create new Users using the same old User class code:

User.new(new_twitter_user)
# => ArgumentError: missing keyword: age
Our program broke!

Let's play it with another scenario. Let's say the Twitter API changed and now returns data to us in the following manner:

newest_twitter_user = {
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  age: 26, 
  location: "NY, NY", 
  bio: "I'm a programmer living in NY!"
}
Now let's see what happens when we try to make a new instance of our User class with the same old User class code:

User.new(newest_twitter_user)
# => ArgumentError: unknown keyword: bio


# Here's our new and improved User class:

class User
  attr_accessor :name, :user_name, :age, :location, :bio

  def initialize(attributes)
    attributes.each do |key, value| 
      self.send("#{key}=", value)
    end
  end
end


#Let's say we didn't want to specify the individual getter and setter methods using named symbols like so:

class User
  # we don't want to do this anymore :(
  attr_accessor :name, :user_name, :age, :location, :bio

  def initialize(attributes)
    attributes.each do |key, value| 
      self.send("#{key}=", value)
    end
  end
end
Instead, we want to dynamically set those methods so that we have a getter and setter automatically declared for every attribute in the attributes Hash. How could we do this?

First, we need to remember that attr_accessor is a class method just like attr_reader and attr_writer. This means we can dynamically add getters or setters, or both, by doing the following:

class User
  def initialize(attributes)
    attributes.each do |key, value|
      # create a getter and setter by calling the attr_accessor method
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
    end
  end
end