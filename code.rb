class Array
  def median
    sorted = self.sort
    mid = (sorted.length - 1) / 2.0
    (sorted[mid.floor] + sorted[mid.ceil]) / 2.0
  end
end

def top(array, &block)
    return array.first if array.length == 1

    first = block.call(array.first)
    last = block.call(array.last)
    middle = block.call(array.median)

    lower = array.slice(0, array.length/2)
    higher = array.slice(array.length/2, array.length)

    if middle.between?(first, last)
        return (first < last) ? top(higher, &block) : top(lower, &block)
    else
        return [top(lower, &block), top(higher, &block)].max
    end
end


array = [1, 2, 4, 5, 10, 7, 5, 2, 1, 0]
function = proc do |x|
    x
end

result = top(array, &function)
puts result
