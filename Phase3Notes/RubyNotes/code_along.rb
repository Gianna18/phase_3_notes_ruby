class Dog
end
fido = Dog.new


#Example of a code in ruby
def happy_birthday(name, current_age)
    puts "Happy Birthday, #{name}"
    current_age += 1
    puts "You are now #{current_age} years old"
  end
  
  happy_birthday("Beyonce", 31)
  # Happy Birthday, Beyonce
  # You are now 32 years old
  # => nil
