Unlike in JavaScript, the == method in Ruby will not coerce strings to numbers before comparing them, or perform some of the other type coercions that JavaScript does. For example, in JavaScript, using the == operator can lead to some strange behavior:

"1" == 1
// => true
0 == []
// => true
[] == ![]
// => true 🤔
In Ruby, the == method checks if the objects on both sides are considered the equivalent values:

"1" == 1
# => false
1 == 1
# => true

In Ruby, this example returns true because Ruby considers these to have equivalent values:

[1, 2, 3] == [1, 2, 3]
# => true
Ruby will also check if an Integer has the equivalent value to a Float, even though they're technically different data types:

1.0 == 1
# => true
The reason for this is because in Ruby, the == operator is actually a method that has unique behavior that depends on which class the method is defined in! The code above is equivalent to the following method call:

