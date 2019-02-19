def bubble_sort(arr)
  index = 1
  times_looped = 0
  swaps = false
  length = arr.length
  length.times do
    while index < arr.length - times_looped
      if arr[index-1] > arr[index]
        arr[index-1], arr[index] = arr[index], arr[index-1]
        swaps = true
      end
      index += 1
    end
    if swaps == false 
      return arr
    end
    times_looped += 1
    index = 1
  end
  arr
end

def bubble_sort_by(arr)
  index = 1
  times_looped = 0
  swaps = false
  length = arr.length
  length.times do
    while index < arr.length - times_looped
      if yield(arr[index-1], arr[index]) > 0
        arr[index-1], arr[index] = arr[index], arr[index-1]
        swaps = true
      end
      index += 1
    end
    if swaps == false 
      return arr
    end
    times_looped += 1
    index = 1
  end
  arr
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end