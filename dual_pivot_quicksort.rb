include RSpec

def main(array)
    result = dual_pivot_quicksort(array, 0, array.length - 1)
    return result
end

def dual_pivot_quicksort(array, left_index, right_index)
    if left_index < right_index
        # find new partition points
        left_pivot_index, right_pivot_index = partition(array, left_index, right_index)
        # recursively sort on the partitioned array
        dual_pivot_quicksort(array, left_index, left_pivot_index - 1)
        dual_pivot_quicksort(array, left_pivot_index + 1, right_pivot_index -1)    
        dual_pivot_quicksort(array, right_pivot_index + 1, right_index)
        return array
    end
    return array
end

def partition(array, left_index, right_index)
    # swap pivot values if needed
    if array[left_index] > array[right_index]
        array[left_index], array[right_index] = array[right_index], array[left_index]
    end
    # set references for "movement" around the array while we sort
    left_reference = left_index + 1
    right_reference = right_index - 1
    moving_reference = left_index + 1
    # need something to compare to for the pivot points
    left_pivot_value = array[left_index]
    right_pivot_value = array[right_index]
    # main sorting loop
    while moving_reference <= right_reference
        nil_check(array[left_reference])
        nil_check(array[right_reference])
        nil_check(array[moving_reference])
        # moving should be in the left partition
        if array[moving_reference] < left_pivot_value
            array[moving_reference], array[left_reference] = array[left_reference], array[moving_reference]
            left_reference += 1
        # moving should be in the right partition
        elsif array[moving_reference] >= right_pivot_value
            # don't swap it with something that still belongs in right partition
            while array[right_reference] > right_pivot_value and moving_reference < right_reference
                right_reference -= 1
            end
            # do the swap
            array[moving_reference], array[right_reference] = array[right_reference], array[moving_reference]
            right_reference -= 1
            # new value doesn't belong in the right partition, so check if it belongs in the left partition
            if array[moving_reference] < left_pivot_value
                array[moving_reference], array[left_reference] = array[left_reference], array[moving_reference]
                left_reference += 1
            end
        end
        moving_reference += 1
    end
    # move the references back so we can put the values from the pivot in the right spot
    left_reference -= 1
    right_reference += 1
    array[left_index], array[left_reference] = array[left_reference], array[left_index]
    array[right_index], array[right_reference] = array[right_reference], array[right_index]
    # give back new partition points
    return left_reference, right_reference
end

def nil_check(value)
    if value.nil?
        raise "A value was nil! only use arrays that don't contain nil."
    end
end