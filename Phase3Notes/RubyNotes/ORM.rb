#For example, you can use code like this to connect your Ruby program to a given database:


database_connection = SQLite3::Database.new('db/my_database.db')

database_connection.execute("SELECT * FROM cats;")

#Let's say we have a program that helps a veterinary office keep track of the pets it treats and those pets' owners. Such a program would have an Owner class and Cat class (among classes to represent other pets). Our program surely needs to connect to a database so that the veterinary office can persist information about its pets and owners.

#Our program would create a connection to the database:

database_connection = SQLite3::Database.new('db/pets.db')
We would create an owners table and a cats table:

database_connection.execute("CREATE TABLE IF NOT EXISTS cats(id INTEGER PRIMARY KEY, name TEXT, breed TEXT, age INTEGER)")

database_connection.execute("CREATE TABLE IF NOT EXISTS owners(id INTEGER PRIMARY KEY, name TEXT)")
Then, we would need to regularly insert new cats and owners into these tables:

database_connection.execute("INSERT INTO cats (name, breed, age) VALUES ('Maru',
'scottish fold', 3)")

database_connection.execute("INSERT INTO cats (name, breed, age) VALUES ('Hana',
'tortoiseshell', 1)")


#As programmers, you might remember, we are lazy. We don't like to repeat ourselves if we can avoid it. Repetition qualifies as a "code smell". Instead of repeating the same, or similar, code any time we want to perform common actions against our database, we can write a series of methods to abstract that behavior.

#For example, we can write a #save method on our Cat class that handles the common action of INSERTing data into the database.

class Cat

  @@all = []

  attr_reader :name, :breed, :age

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def save(database_connection)
    database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)", self.name, self.breed, self.age)
  end
end

#Now let's create some new cats and save them to the database:

database_connection = SQLite3::Database.new('db/pets.db')

Cat.new("Maru", "scottish fold", 3)
Cat.new("Hana", "tortoiseshell", 1)

Cat.all.each do |cat|
  cat.save(database_connection)
end

#Here we establish the connection to our database, create two new cats and then iterate over our collection of cat instances stored in the Cat.all method. Inside this iteration, we use the Cat#save method, giving it arguments of the data specific to each cat to INSERT those cat records into the cats table.

#In building an ORM, it is conventional to pluralize the name of the class to create the name of the table. 

To return all the songs in the database, we need to execute the following SQL query: SELECT * FROM songs. Let's store that in a variable called sql using a heredoc (<<-) since our string will go onto multiple lines:

sql = <<-SQL
  SELECT *
  FROM songs
SQL


# Next, we will make a call to our database using DB[:conn]. This DB hash is located in the config/environment.rb file:
DB = { conn: SQLite3::Database.new("db/music.db") }


# Notice that the value of the connection in this hash is actually a new instance of the SQLite3::Database class. This is how we will connect to our database. Our database instance responds to a method called execute that accepts raw SQL as a string. Let's pass in that SQL we stored above:

class Song

  # ... rest of methods

  def self.all
    sql = <<-SQL
      SELECT *
      FROM songs
    SQL

    DB[:conn].execute(sql)
  end

end