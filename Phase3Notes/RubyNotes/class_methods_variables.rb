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