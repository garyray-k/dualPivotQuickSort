include RSpec

def dual_pivot_quicksort(array)
    # setup a result array
    result = recursive_dual_pivot_quicksort(array, 0, array.length - 1)

    
    # output result
    return result
end

# define recursive method
def recursive_dual_pivot_quicksort(array, left_position, right_position)
    # handle two element array but comparing values and reutning
    if array.length == 2 and array[left_position] < array[right_position]
        # two element array already sorted
        return array
    else
        # two element array with high then low
        # swap and continue recursion
        array = swap_positions(array, left_position, right_position)
        return array
    end

    if left_position >= right_position
        return array
    end

    # break array into thirds
    # set pivot positions
    pivot_position_1 = array.length / 3
    pivot_position_2 = pivot_position_1 * 2

    # select first third as first pivot
    pivot_value_1 = array[pivot_position_1]
    # double it to get to two thirds
    pivot_value_2 = array[pivot_position_2]

    # check if pivot elements need to be swapped
    if array[pivot_value_1] > array[pivot_value_2]
        array = swap_positions(array, pivot_value_1, pivot_value_2)
    end

    # partition the array into thirds
    # return back new indexes based on partitioning
    pivot_index_1, pivot_index_2 = partition(array, left_position, right_position, pivot_value_1, pivot_value_2, pivot_position_1, pivot_position_2)
    
    # use these new partition points to recursively sort again on those chunks
    array = recursive_dual_pivot_quicksort(array, left_position, pivot_index_1 - 1)
    array = recursive_dual_pivot_quicksort(array, pivot_index_1, pivot_index_2 - 1)
    array = recursive_dual_pivot_quicksort(array, pivot_index_2, right_position)
    return array
end

def partition(array, left_position, right_position, pivot_value_1, pivot_value_2, pivot_position_1, pivot_position_2)
    center_position = pivot_position_1 + 1
    while left_position <= pivot_position_1 and center_position <= right_position
        # on each loop, check for nil in each value
        nil_check(array[left_position])
        nil_check(array[center_position])
        nil_check(array[right_position])

        # see if left position value is less than left pivot
        # also make sure we don't move left position into center parition
        while array[left_position] < pivot_value_1 and left_position <= pivot_position_1
            left_position += 1
        end
        # make sure we're higher than pivot 1 value
        # but lower than pivot 2 value
        # move center position to meet right position
        while array[center_position] > pivot_value_1 and array[center_position] < pivot_value_2
            center_position += 1
        end

        while array[right_position] > pivot_value_2
            right_position -= 1
        end

        # compare and swap
        # left and center comparison
        if array[left_position] > pivot_value_1 and array[center_position] < pivot_position_1
            array = swap_positions(array, left_position, center_position)
            # don't move beyond pivot position 1
            if left_position < pivot_position_1
                left_position += 1
            end
        end
        # center and right comparison
        if array[center_position] > pivot_value_2 and array[right_position] < pivot_value_2 and array[right_position] > pivot_value_1
            array = swap_positions(array, center_position, right_position)
            center_position += 1
            right_position -= 1
        end
        # left and right comparison
        if array[left_position] > pivot_value_2 and array[right_position] < pivot_value_1
            array = swap_positions(array, left_position, right_position)
            # limit left to pivot position 1
            if left_position < pivot_position_1
                left_position += 1
            end
            right_position -= 1
        end
    end
    # return new dividing points for array
    return left_position, center_position
end

# method to swap two positions within array
def swap_positions(array, position_1, position_2)
    # hold values to swap in variables before assigning them within the array
    value1 = array[position_1]
    value2 = array[position_2]
    array[position_1] = value2
    array[position_2] = value1
    # give back the array with updated positions
    return array
end

# ensure the array doesn't contain nil values
def nil_check(value)
    if value.nil?
        # throw an error if there is a nil value.
        raise "A value was nil! only use arrays that don't contain nil."
    end
end