$name = 'Gideon'

def my_name
  puts "My name is #{$name}" # > My name is Gideon
end

def what_was_my_name
  $name = 'Kimutai'
  puts "My name is #{$name}" # > My name is Kimutai
end

my_name
what_was_my_name
puts $name # > Kimutai

=begin
Things to note
--------------
Avoid global variables, it can be modified at any point which is
really what we dont want.
=end
