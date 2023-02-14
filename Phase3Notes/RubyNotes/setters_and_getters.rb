Setters and Getters
Setter and getter methods are integral to object-oriented programming in Ruby. They are what enable us to assign attributes to our objects (e.g., name or breed) and retrieve the value of those attributes.

To review, if we have a Person class, our setter and getter for the name attribute will look like this:

class Person

  # setter method
  def name=(name)
    @name = name
  end

  # getter method
  def name
    @name
  end

end

# or write it like this 

class Person
    attr_accessor :name
  
  end
  
  jay_z = Person.new
  jay_z.name = "Shawn Carter"
  jay_z.name
  # => "Shawn Carter"

  #Let's say that instead of storing the full name in a single name variable, we decided we want to store the first and last name separately. We could simply replace our attr_accessor for name with attr_accessors for first_name and last_name, but then we'd need to set two separate attributes when we create a new instance of the Person class.

#To get around this, we can create a custom setter method that will enable us to continue passing the full name when we create an instance, but will store the first and last name as separate attributes:

  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end
With this code, we assign a name to an instance in the usual way, passing in the full name as the argument. Our custom setter method splits the full name into the first and last names and assigns them to the corresponding instance variables.

We can also create a custom getter method for name that will return the full name even though it is no longer stored in an instance variable:

  def name
    "#{@first_name} #{@last_name}".strip
  end
Putting it all together:

class Person
  attr_reader :first_name, :last_name

  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

end

jay_z = Person.new
jay_z.name = "Shawn Carter"

jay_z.first_name
# => "Shawn"

jay_z.last_name
# => "Carter"

jay_z.name
# => "Shawn Carter"