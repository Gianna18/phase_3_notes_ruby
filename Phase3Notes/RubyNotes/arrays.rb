shopping_list = ["Cookies", "Ice Cream", "Snickers"]
You can also access elements starting from the end of an array by providing a negative index:

shopping_list[-1]
# => "Snickers"

Ruby also has a couple methods for convenience for accessing elements at the beginning and end of arrays:

shopping_list.first
# => "Cookies"
shopping_list.last
# => "Snickers"
The #last method in particular is quite convenient compared to the equivalent JavaScript code:

shoppingList[shoppingList.length - 1];
Ruby also has the shovel method (<<) which does the same thing as #push, but is more commonly used:

shopping_list << "Tums"
# => ["Cake", "Cookies", "Mint Chocolate Chip Ice Cream", "Snickers", "M&Ms", "Tums"]

Ruby also has a couple ways to combine multiple arrays. You can use the #concat:

one_two_three = [1, 2, 3]
four_five_six = [4, 5, 6]

one_two_three.concat(four_five_six)
# => [1, 2, 3, 4, 5, 6]
one_two_three
# => [1, 2, 3, 4, 5, 6]

#concat changes the data in the original array, so if you want to combine arrays without changing the original, you can also use the + method:

one_two_three = [1, 2, 3]
four_five_six = [4, 5, 6]

one_two_three + four_five_six
# => [1, 2, 3, 4, 5, 6]
one_two_three
# => [1, 2, 3]

To check if a particular element is present in an array, use #include?:

letters = ["a", "b", "c"]
letters.include?("a")
# => true
letters.include?("e")
# => false
In Ruby, there's a convention that methods that return a boolean value are named with a question mark at the end, like #include?.

To reverse all the elements of an array, use #reverse:

letters.reverse
# => ["c", "b", "a"]
letters
# => ["a", "b", "c"]

Ruby also has a #sum method which will add every element in an array:

[1, 2, 3].sum
# => 6

Compare this to JavaScript:

[1, 2, 3].reduce((sum, num) => sum + num);

Last but not least, Ruby has a #uniq method for returning only the unique elements from an array:

[1, 1, 2, 3, 5].uniq
# => [1, 2, 3, 5]
Again, this is quite convenient compared what you'd have to do to implement this functionality in JavaScript!

[1, 1, 2, 3, 5].filter((num, index, array) => array.indexOf(num) === index);

#Special Array Syntax
Ruby supports a couple of other special syntaxes for creating arrays which you may encounter in other Ruby code. You can use %w to create an array of strings (assuming each string is one word):

%w[pending resolved rejected]
# => ["pending", "resolved", "rejected"]
You can also create an array of symbols with %i:

%i[pending resolved rejected]
# => [:pending, :resolved, :rejected]