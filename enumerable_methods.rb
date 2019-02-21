module Enumerable
  def my_each
    index = 0
    length = self.length
    arr = self
    while index < length
      yield(arr[index])
      index +=1
    end
  end

  def my_each_with_index
    index = 0
    length = self.length
    arr = self
    while index < length
      yield(arr[index], index)
      index +=1
    end
  end

  def my_select
    new_arr = []
    self.my_each do |num|
      if yield(num)
        new_arr.push(num)
      end
    end
    new_arr
  end

  def my_all?
    self.my_each do |num|
      if !yield(num)
        return false
      end
    end
    true
  end

  def my_any?
    self.my_each do |num|
      if yield(num)
        return true
      end
    end
    false
  end

  def my_none?
    self.my_each do |num|
      if yield(num)
        return false
      end
    end
    true
  end

  def my_count(check = "")
    count = 0
    self.my_each do |num|
      if block_given?
        if yield(num)
          count += 1
        end
      elsif check.is_a? String
        count += 1
      else
        if num == check
          count += 1
        end
      end
    end
    count
  end

  def my_map(proc = nil)
    new_arr = []
    self.my_each do |num|
      if proc != nil
        new_arr.push(proc.call(num))
      else
        new_arr.push(yield(num))
      end
    end
    new_arr
  end

  def my_inject(start = "")
    if start.is_a? String
      result = 0
    else
      result = start
    end
    self.my_each do |num|
      result = yield(result, num)
    end
    result
  end
end

arr = [1,2,3,4,5,6,7,8,9,10]
arr.my_each do |num|
  puts num
end

arr.my_each_with_index do |num, index|
  puts num.to_s + " at index: " + index.to_s
end

arr.my_select do |num|
  num % 2 == 0
end

arr.my_all? do |num|
  num < 10
end

arr.my_any? do |num|
  num < 0
end

arr.my_none? do |num|
  num < 2
end

arr.my_count{|num| num % 2 == 0}

def multiply_els(arr)
  arr.my_inject(1) do |total, num|
    total * num
  end
end

multiply_els([2,4,5])

new_proc = Proc.new {|x| x + 5 }
arr.my_map(new_proc) 