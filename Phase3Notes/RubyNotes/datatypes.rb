# You'll often hear it said that "in Ruby, everything is an object". All of the methods that we called on strings above are available because the string literal "hello" is an instance of the String class. Thanks to Ruby's introspection Links to an external site.features, you can see for yourself:

# Calling the methods method on any Ruby object will display a list of all the methods that object responds to (you'll see :upcase, :downcase, :reverse and more in that list):

# A Note on Notation
# In Ruby, there are two different kinds of methods: instance methods and class methods. You won't encounter class methods until the section on object-oriented programming, but technically all the methods we're writing now are instance methods. An instance method means a method that's called on an instance (one unique object) of a class.

# In Ruby, we use the # at the beginning of a method when referring to it in documentation to indicate that it's an instance method, and the . at the beginning to indicate class methods:

#: instance method
#.: class method

#Numbers
#In Ruby, unlike JavaScript, there are two types of numbers: Integers and Floats.

#Integers are whole numbers, like 7.

#Floats are decimal numbers, like 7.3

There are a number of methods available to you for operating on or manipulating integers. You can read more about Integers here Links to an external site.and more about Floats here Links to an external site.. For now, we'll just check out a few examples:

7.5.floor
# => 7
7.5.ceil
# => 8
10.next
# => 11
You can convert other some data types to integers or floats with the #to_i and #to_f methods:

"1".to_i
# => 1
"1.1".to_i
# => 1
"1.1".to_f
# => 1.1
Unlike JavaScript, Ruby won't convert an Integer to a Float when performing math operations, unless one side of the operation is already a Float:

4 / 3
# => 1
4 / 3.0
# => 1.3333333333333333
4 / 3.to_f
# => 1.3333333333333333

Booleans
There are only two values of the Boolean data type: true and false. In Ruby, however, there is no such thing as a Boolean class. Instead, every appearance, or instance, of true and false in your program are instances of TrueClass and FalseClass respectively:

true.class
# => TrueClass
false.class
# => FalseClass
Ruby, like JavaScript, has the concept of "truthy" and "falsy" values as well: values which, when coerced to their equivalent boolean value, or evaluated as part of a conditional statement, return either true or false:

!!true
# => true
!!false
# => false
!!1
# => true
!!0
# => true
!!""
# => true
!!nil
# false
In Ruby, only nil and false are falsy values. Everything else is truthy, even 0 and empty strings.

Symbols
A symbol is a representation of a piece of data. Symbols look like this :my_symbol. You write symbols by placing a : in front of the symbol name:

:this_is_a_symbol


Arrays
You can also create an array with the Array.new syntax Links to an external site.. Just typing Array.new will create an empty array ([]):

Array.new
# => []

Hashes
Hashes are Ruby's equivalent of a plain old JavaScript object. They are composed of key/value pairs. Each key points to a specific value, just like a word and a definition in a regular dictionary.

There are a few ways of writing hashes. You can create a hash by simply writing key/value pairs enclosed in curly braces:

{ key1: "value1", key2: "value2" }

Using the JSON-style syntax above will create a hash with Symbols for keys. To access data from this hash, you can use the bracket notation and pass in the symbol for the key you are trying to access:

my_hash = { key1: "value1", key2: "value2" }
my_hash[:key2]
# => "value2"
Unlike JavaScript, you cannot use the dot notation to access keys on hashes — only the bracket notation will work:

my_hash = { key1: "value1", key2: "value2" }
my_hash.key2
# NoMethodError (undefined method `key2' for {:key1=>"value1", :key2=>"value2"}:Hash)
You can also create hashes with Strings for keys:

{ "i'm a key" => "i'm a value!", "key2" => "value2" }
This syntax is known as the hash rocket syntax, and is useful if you need String keys for Symbols; however, in general, using Symbols for keys is preferred.

Last but not least, you can also use the Hash.new syntax Links to an external site., which would create an empty hash, {}:

Hash.new
# => {}