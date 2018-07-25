# using class variables is considered a bad practice

class Parent
  @@children = 0

  def give_birth
    @@children += 1
  end

  def number_of_children
    puts @@children
  end
end

parent = Parent.new

puts parent.number_of_children

parent.give_birth

puts parent.number_of_children

parent.give_birth

puts parent.number_of_children

parent.give_birth
