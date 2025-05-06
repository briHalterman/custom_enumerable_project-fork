module Enumerable
  # Your code goes here
  def my_map # collect
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

  def my_select # filter
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

  def my_none?
    # Returns true if the block returns a falsey value for every element
    self.my_each do |item|
      if yield(item)
        return false
      end
    end
    true
  end

  def my_count(arg = nil)
    # Returns the number of elements that match a given argument or block condition, or the total number of elements if no block or argument is given
    counter = 0
    self.my_each do |item|
      if block_given?
        if yield(item)
          counter += 1
        end
      elsif !arg.nil?
        if item == arg
          counter += 1
        end
      else
        return self.length
      end
    end
    return counter
  end

  def my_inject(accumulator = nil) # reduce
    # Combines all elements of a collection, specified by a block, and returns accumulated result
    skip_first = false

    if accumulator.nil?
      accumulator = self[0]
      skip_first = true
    end

    self.my_each_with_index do |item, index|
      next if skip_first && index == 0
      accumulator = yield(accumulator, item)
    end

    accumulator
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

