# times loop
10.times do |i|
    puts "Looping!"
    puts "i is: #{i}"
  end

  The syntax here is quite different from JavaScript, so let's break it down.

#times is a method in the Integer class Links to an external site.that can be called on a number. It takes a block of code as an argument, starting with do and ending with end, and will run the code inside that block in a loop. You can optionally provide a block parameter, which in the example above, is represented by the i variable within the pipes: |i|.

Between the do and the end, you write whatever code you want to run in the loop.

Each time Ruby runs the loop, it will assign a new value for the block parameter i, which will start at 0 and end at 9 (since we're running this loop 10 times):

10.times do |i|
  puts "i is: #{i}"
end
# i is: 0
# i is: 1
# i is: 2
# i is: 3
# i is: 4
# i is: 5
# i is: 6
# i is: 7
# i is: 8
# i is: 9

#used for one-line blocks
10.times { |i| puts "i is: #{i}" }