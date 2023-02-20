#Defining Public Methods
#We've already been writing public methods: intro and self.all. We can call them from outside the scope of the class declaration, like on the instance of the class or the class itself. Public methods are called by an explicit receiver: the instance of phil explicitly receives the method intro.

##Private methods cannot be called by an explicit receiver. What does that mean? It means we can only call private methods within the context of the defining class: the receiver of a private method is always self.

class Bartender
    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def intro
      "Hello, my name is #{name}!"
    end
  
    def make_drink
      @cocktail_ingredients = []
      choose_liquor
      choose_mixer
      choose_garnish
      "Here is your drink. It contains #{@cocktail_ingredients}"
    end
  
    private
  
    def choose_liquor
      @cocktail_ingredients << "whiskey"
    end
  
    def choose_mixer
      @cocktail_ingredients << "vermouth"
    end
  
    def choose_garnish
      @cocktail_ingredients << "olives"
    end
  
  end

  If we try to call #choose_liquor with an instance of a bartender, we get an error:

phil.choose_liquor
# NoMethodError: private method `choose_liquor' called for #<Bartender:0x007f9f5b03d318 @name="Phil">
#Again, private methods cannot be called by an explicit receiver. Because phil is the explicit receiver of choose_liquor, the method errors out.

#However, if we call make_drink, the choose_liquor method works. What gives?

phil.make_drink
# Here is your drink. It contains ["whiskey", "vermouth", "olives"]