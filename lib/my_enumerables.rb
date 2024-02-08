module Enumerable
  # Your code goes here

  def my_inject(n)
    sum = n
    self.each do |value|
      running_total = yield(sum, value)
      sum = running_total
    end

    return sum
  end

  
  def my_map(&block)
    returned_arr = []

    self.each do |elem|
      returned_arr << block.call(elem)
    end

    returned_arr
  end  
  
  def my_count
    returned_arr = []

    if block_given?
      self.each { |elem| returned_arr << elem if yield elem }
    else
      self.each { |elem| returned_arr << elem }
    end

    returned_arr.length
  end
  
  def my_none?(&block)
    returned_arr = []

    self.each do |elem|
      returned_arr << elem if block.call(elem)
    end

    return returned_arr.length == 0
  end
  
  def my_any?
    returned_arr = []

    self.each do |elem|
      returned_arr << elem if yield(elem)
    end

    return returned_arr.length > 0
  end
  
  def my_all?
    returned_arr = []

    self.each do |elem|
      returned_arr << elem if yield(elem)
    end

    return self.length == returned_arr.length
  end
  
  
  def my_select(&block)
    returned_arr = []

    self.each do |elem|
      returned_arr << elem if block.call(elem)
    end

    return returned_arr
  end


  def my_each_with_index(&block)
    returned_arr = []

    if block.arity == 1
      index = 0
      while index < self.length
        yield(self[index])
        returned_arr << self[index]
        index += 1
      end

    elsif block.arity == 2
      index = 0
      while index < self.length
        yield(self[index], index)
        returned_arr << [self[index], index]
        index += 1
      end

    end

    return returned_arr
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    returned_arr = []
    self.cycle(1) do |elem|
      yield(elem)
      returned_arr << elem
    end

    return returned_arr
  end
end