# self is similar to this in javascript

class Dog {
  showingThis() {
    console.log(this);
  }
}

const fido = new Dog();
fido.showingThis();
// => Dog {}


class Dog
    attr_accessor :name, :owner
  
    def initialize(name)
      @name = name
    end
  
    def bark
      "Woof!"
    end
  
    def get_adopted(owner_name)
      self.owner = owner_name
    end
  
  end

 # Here, we use the self keyword inside of the #get_adopted instance method to refer to whichever dog this method is being called on. We set that dog's owner property equal to the new owner's name by calling the #owner= method on self inside the method body.

#Think about it: if self refers to the object on which the method is being called, and if that object is an instance of the Dog class, then we can call any of our other instance methods on self.


#if we wanted our dog to bark when they get adopted, we could refactor our code as follows:

class Dog
    attr_accessor :name, :owner
  
    def initialize(name)
      @name = name
    end
  
    def bark
      puts "Woof!"
    end
  
    def get_adopted(owner_name)
      self.bark # calls the Dog#bark method
      self.owner = owner_name
    end
  
  end

  #Implicit receiver
 # However, we can also use the implicit receiver syntax, and omit the self keyword when calling other instance methods:

class Dog
  attr_accessor :name, :owner

  def initialize(name)
    @name = name
  end

  def bark
    puts "Woof!"
  end

  def get_adopted(owner_name)
    bark # implicit receiver will be self
    self.owner = owner_name
  end

end

In #initialize we use the self keyword to refer to the new object that has just been created by #new. Remember that when #new is called, it creates a new instance of the class and then calls #initialize on that new instance. So, #initialize is technically an instance method. Inside an instance method we are in what is called method scope and self will refer to whichever instance the method is being called on.

