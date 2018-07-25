def some_method
  val = 10
  puts val # will print out 10 because it is within this method scope
end

some_method
puts val # will raise an error because it does not exist in the current scope
