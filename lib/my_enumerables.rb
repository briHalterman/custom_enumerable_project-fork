module Enumerable
  # Your code goes here
  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end

[1, 2, 3].map(&:even?)