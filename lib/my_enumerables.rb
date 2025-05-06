module Enumerable
  # Your code goes here
  def my_map
    # Iterates through a collection and builds a new array containing the results of running the block once for each element
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  def my_each_with_index
    # Iterates through a collection and yields each element along with its index, returning the original collection
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    # Iterates through a collection and builds a new array containing only the elements for which the block returns a truthy value
    new_array = []
    self.my_each do |item|
      if yield(item)
        new_array << item
      end
    end
    new_array
  end

  def my_all?
    # Returns true if the block returns a truthy value for every element
    self.my_each do |item|
      if !yield(item)
        return false
      end
    end
    true
  end

  def my_any?
    # Returns true if the block returns a truthy value for at least one element
    self.my_each do |item|
      if yield(item)
        return true
      end
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # Iterates through a collection and yields each element to a block, returning the original collection unchanged
  def my_each
    for item in self
      yield(item)
    end
  end
end

