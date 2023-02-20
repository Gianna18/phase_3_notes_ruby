#Modules allow us to collect and bundle a group of methods and make those methods available to any number of classes. 

#This is the benefit of using modules: we can share behavior between multiple classes without relying on inheritance.

#In order to lend a module's methods to a class as class methods, we use the extend keyword. 

#We refer to the namespaced modules or classes with ::. This syntax references the parent and child relationship of the nested modules.

class Dancer
    extend FancyDance::ClassMethods
    include FancyDance::InstanceMethods
  end
  class Kid
    extend FancyDance::ClassMethods
    include FancyDance::InstanceMethods
  end 

  Namespacing vs Inheritance
Inheritance using the < syntax implies that a class is a type of another class. A BMW class should inherit from a Car class because a BMW is a type of car: class BMW < Car.

But what about the :: that we're using for our modules? The :: syntax just denotes a namespace. Doing BMW::Car just gives the BMW class access to all constants, instance methods, etc, without stating that a BMW is a type of car. The :: syntax carries all public items over to the inheriting class or module.