class Array
  def middle
    mid = (length - 1) / 2.0
    (self[mid.floor] + self[mid.ceil]) / 2.0
  end
end

def global_max(array, &block)
  return array.first if array.length == 1

  first = block.call(array.first)
  last = block.call(array.last)
  middle = block.call(array.middle)

  lower = array.slice(0, array.length / 2)
  higher = array.slice(array.length / 2, array.length)

  if middle.between?(first, last)
    if first < last
      return global_max(higher, &block)
    else
      return global_max(lower, &block)
    end
  else
    return [global_max(lower, &block), global_max(higher, &block)].max
  end
end

arrays = [
  [1, 2, 4, 5, 10, 7, 5, 2, 1, 0],  # Expected max: 10
  [100, 90, 80, 10],  # Expected max: 
  [0, 0.1, 0.2, 0.3, 0.4, 0.5],
  [42]
]

function = proc do |x|
  x
end

arrays.each do |array|
  result = global_max(array, &function)
  puts result
end
