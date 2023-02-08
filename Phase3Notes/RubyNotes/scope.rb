What is Scope?
Methods in Ruby create their own scope. "Scope" refers to the areas of your program in which certain data is available to you. Any local variable created outside of a method will be unavailable inside of a method. In addition, local variables created inside of a method (i.e. in between the def and end keywords of a method) 'fall out of scope' once you're outside the method.

This is a key difference between Ruby and JavaScript: in Ruby, local variables are only available within the scope of the method they are defined in.

So far, we've seen that variables defined outside of methods are not available inside methods (unless we pass them in as arguments). This works the other way around as well: variables defined inside of methods are not available outside of those methods.

Variable Types
So far, we've encountered one type of variable in Ruby: local variables. They're called "local" because they don't ever leave the scope they're defined in. There are other types of variables in Ruby as well, which can be defined using different naming conventions:

Local variables: must start with a lowercase letter or an underscore (_): name = "Lucy"
Global variables: must start with a dollar sign ($): $name = "Lucy"
Instance variables: must start with an at symbol (@) @name = "Lucy")
Class variables: must start with two at symbols (@@) (@@name = "Lucy")
We'll discuss instance variables and class variables later along with Object Oriented Programming, but global variables can be useful to see how Ruby treats different variable types with regards to their scope.

For example, we could use a global variable to make the $evil_monster available everywhere in our code:

$evil_monster = "Bowser"

def princess_peaches_castle
  puts "#{$evil_monster} is trying to kidnap Princess Peach!"
end
You should almost never need to use global variables in your code. Having a lot of global variables makes your code unpredictable and challenging to debug, so you should reserve them for special cases (like application-wide configuration).

Remember: A local variable defined inside a method can't leave that method. It is not available to your program outside of the method. A local variable defined outside of a method can only be made available to the code inside the method if you pass that variable in to the method as an argument.