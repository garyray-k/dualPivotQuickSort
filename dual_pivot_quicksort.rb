include RSpec

def dual_pivot_quicksort(array)
    # setup a result array
    result = []

    # ensure we're working with an array with some substance. 
    # if it's empty or only has one, give it back, because it's already sorted
    if array.empty? or array.length == 1
        return array
    end

    # identify the two pivot points and put them into a variable
    left_pivot = array.first
    right_pivot = array.last

    # if array.length == 2 then check only pivots and return array
    if array.length == 2 and array.first < array.last # already sorted two element array returns itself
        return array
    else
        # swap input first and last and return
        return [array.last, array.first]
    end

    # swap positions if necessary and reassign variables
    if left_pivot > right_pivot
        array.first = right_pivot
        array.last = left_pivot
        left_pivot = array.first
        right_pivot = array.last
    end
    
    # create three arrays to dump values into as we compare
    # array for numbers less than or equal to left pivot
    left_array = []
    # array for number in between both pivot points
    center_array = []
    # array for numbers greater than or equal to right pivot
    right_array = []

    # iterate over array and sort based on pivots points
    array.each do |value_in_array|
        # nil check!
        nil_check(value_in_array)
        # if less than left -> left array; 
        # if equal to left -> left array
        if value_in_array <= left_pivot
            left_array.append(value_in_array)
        # if greater than right -> right array; 
        elsif value_in_array > right_pivot
            right_array.append(value_in_array)
        # if equal to right; right array first element
        elsif value_in_array == right_pivot
            right_array.prepend(value_in_array)
        # else dump into center array
        else
            center_array.append(value_in_array)
        end
    end

    # append left-center-right after sorting
    # recursive sort left array
    result.append(dual_pivot_quicksort(left_array))
    # recursive sort center array
    result.append(dual_pivot_quicksort(center_array))
    # recursive sort right array
    result.append(dual_pivot_quicksort(right_array))

    # output result
    return result
end

# ensure the array doesn't contain nil values
def nil_check(value)
    if value.nil?
        # throw an error if there is a nil value.
        raise "A value was nil! only use arrays that don't contain nil."
    end
end