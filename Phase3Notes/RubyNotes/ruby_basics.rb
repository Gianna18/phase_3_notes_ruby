Object-oriented programming (OOP) is a type of programming based on the concept of "objects", which can contain data, in the form of fields (often known as attributes or properties), and code, in the form of procedures (often known as methods). OOP is all about being able to structure code so that its functionality can be shared throughout the application. This is opposed to procedural programming (PP), in which you build programs in sequential order and call methods when you want shared behavior between pages in the application.

A Ruby class both contains the instructions for creating new objects and has the ability to create those objects. Calling .new on the Dog class is like getting a brand new dog object from an assembly line which produces a series of similar dog objects based on the same Dog template.

Here's what our Dog class would look like:

class Dog
  # some code to describe a dog
end

An instance is a single occurrence of an object. Instances refer to the individual objects produced from the class.

Classes are the blueprints that define the behavior and information our objects will contain. They let us manufacture and instantiate new instances.

In summary: to create a new class definition, use the class keyword. A class is like a template, or a blueprint, for creating objects with similar characteristics.

To use the class to create individual objects, use the .new method. This will instantiate (create a new instance of) an object from the class. Each instance created using the class by calling .new will be a unique object in memory.

Dot Notation
class Dog
end

fido = Dog.new #=> #<Dog:0x007fc52c2cc588>

fido.object_id #=> 70173135795280

In dot notation, we call the object that received the method the receiver, and we call the method the message.

A local variable that is defined inside one method cannot be accessed by another method:

We define an instance variable by prefacing the variable name with an @ symbol.

Instance variables are bound to an instance of a class. That means that when we set the value of an attribute on an instance of a class, the value we set is associated with that particular instance. This makes intuitive sense: a dog's name belongs to that specific dog, not to Dogs in general.

Instance variables hold information about an instance, i.e., they describe attributes or properties of the instance, such as its name or breed. They can be called on throughout the class, without needing to be passed into other methods as arguments (as would be the case with local variables).