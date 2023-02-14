#Let's start with a JavaScript example. Say we had an array of strings, and we wanted to transform that array into a new array with all the strings in uppercase. To do that, we can use the map method:

    const upcased = ["this", "is", "JavaScript"].map((str) => {
      return str.toUpperCase();
    });
    
    upcased;
    // => ["THIS", "IS", "JAVASCRIPT"]

    Ruby also has a #map method that can be used with arrays. In Ruby, the #map method is an Enumerable Links to an external site.: a method that "enumerates" (goes one by one) over every element of a collection. Here's how that same function from JavaScript could be written in Ruby. Run the following code in IRB:

upcased = ["this", "is", "Ruby"].map do |str|
  str.upcase
end

upcased
# => ["THIS", "IS", "RUBY"]

10.times do |i|
    puts "i is: #{i}"
  end
  The #map method, like #times, takes a block of code as an argument. Think of this block as having similar functionality as the callback function in JavaScript's #map method. The block starts with do and ends with end. It takes one argument in the pipes || known as a block parameter, that represents each element from the array. In the case of #map, whatever the return value of the block is will be added to a new array, which is returned by map.

  #What is a block?
A block is a chunk of code between braces, { } or between do/end keywords that you can pass to a method almost exactly like you can pass an argument to a method. 

    What are the | |?
    Those are called "pipes". When invoking an enumerable method like #map, the variable name inside the pipes acts as an argument that is being passed into the block.

    ["this", "is", "Ruby"].map do |astronaut|
        astronaut.upcase
      end
      # => ["THIS", "IS", "RUBY"]

      Accessing the Index
Sometimes it's helpful to know the index position of the element you're iterating over in an array. JavaScript lets you access the index by assigning a second parameter to the #map method, like so:

["this", "is", "JavaScript"].map((str, index) => {
  if (index % 2 === 0) {
    return str.toUpperCase();
  } else {
    return str;
  }
});
// => ["THIS", "is", "JAVASCRIPT"]
With Ruby, to access the index, you can chain the #with_index method on most enumerable methods, including #map:

["this", "is", "Ruby"].map.with_index do |str, index|
  if index.even?
    str.upcase
  else
    str
  end
end
# => ["THIS", "is", "RUBY"]

"pretzel colon" syntax
["this", "is", "Ruby"].map(&:upcase)
# => ["THIS", "IS", "RUBY"]

#Note that this syntax only works in the exact scenario we have above, where we are calling one method on every element in the array. If we needed to do more work in the block, like uppercase every string and add an exclamation mark, we'd need to use block syntax instead:

["this", "is", "Ruby"].map(&:upcase + "!")
# => NoMethodError (undefined method `+' for :upcase:Symbol)

["this", "is", "Ruby"].map { |str| str.upcase + "!" }
# => ["THIS!", "IS!", "RUBY!"]

Enumerating with Hashes
One other nice feature of Ruby enumerable methods is that you can use them with other data types beyond just arrays. You can also use enumerable methods with hashes to iterate over all the key-value pairs. For example, we can use the #each method (similar to JavaScript's forEach) to access all the key-value pairs in a hash:

book = { title: "The Hobbit", author: "J. R. R. Tolkien", published: 1937 }
book.each do |key, value|
  puts "Key: #{key}"
  puts "Value: #{value}"
end
# Key: title
# Value: The Hobbit
# Key: author
# Value: J. R. R. Tolkien
# Key: published
# Value: 1937
#All the other enumerable methods, including #map, will also work on hashes; however, situations where you'd use methods other than #each with a hash are less common.

#each
Use Case: When you want to access each element of the array, but don't care about returning a new array.

new_array = ["this", "is", "Ruby"].each do |str|
    puts str.upcase
  end
  # "THIS"
  # "IS"
  # "RUBY"
  
  new_array
  # => ["this", "is", "Ruby"]

  #map / #collect
Use Case: When you want to access every element of an array, calculate a new value, and return a new array of those new values with the same length as the original array.

[1, 2, 3].map { |num| num * 2 }
# => [2, 4, 6]

users = [{ name: "Duane", phone: "555-555-5555"}, { name: "Liza", phone: "555-555-5556" }]
users.map do |user|
  "Name: #{user[:name]} | Phone: #{user[:phone]}"
end
# => ["Name: Duane | Phone: 555-555-5555", "Name: Liza | Phone: 555-555-5556"]


#filter / #select / #find_all
Use Case: When you want to access every element of an array, check if it matches some criteria, and return a new array of all the values that match.

For example, here's how you could filter an array of numbers in JavaScript and return only the even values:

[1, 2, 3, 4, 5].filter((num) => num % 2 === 0);
// => [2, 4]
Here's the equivalent syntax in Ruby:

[1, 2, 3, 4, 5].filter { |num| num.even? }
# => [2, 4]

For example, let's say you're working on a method to filter out all the nil values from an array of strings, then capitalize each word. You may be tempted to try something like this:

words = ["give", "it", nil, "your", nil, "best", "shot"]
words.filter do |word|
  if word != nil
    word.capitalize
  end
end
# => ["give", "it", "your", "best", "shot"]

The reason this doesn't produce an array of capitalized words is that #filter will only return elements from the original array; it won't produce any new values. To achieve the desired effect, you'd need to #filter, then #map:

words = ["give", "it", nil, "your", nil, "best", "shot"]

filtered_words = words.filter do |word|
  word != nil
end

capitalized_words = filtered_words.map do |word|
  word.capitalize
end
# => ["Give", "It", "Your", "Best", "Shot"]

Or, more concisely, thanks to method chaining:

words.filter { |word| word != nil }.map(&:capitalize)

#find / #detect
Use Case: When you want to access every element of an array, check if it matches some criteria, and return the first element that matches.

[1, 2, 3, 4, 5].find { |num| num.even? }
# => 2

[1, 2, 3, 4, 5].filter { |num| num.even? }
# => [2, 4]

users = [{ name: "Duane", phone: "555-555-5555"}, { name: "Liza", phone: "555-555-5556" }]
users.find do |user|
  user[:name] == "Liza"
end
# => { name: "Liza", phone: "555-555-5556" }

#sort
Use case: return a new array where all the elements have been sorted based on some criteria.

nums = [1, 5, 3]
sorted_nums = nums.sort
sorted_nums
# => [1, 3, 5]

The spaceship operator, also called the combined comparison operator, returns:

0 if the first operand equals the second,
-1 if the first operand is less than the second, and
1 if the first operand is greater than the second.