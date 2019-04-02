include RSpec
require 'byebug'

def dual_pivot_quicksort(array)
    # setup a result array
    result = recursive_dual_pivot_quicksort(array, 0, array.length - 1)
    # byebug # debug breakpoint
    # output result
    return result
end

# define recursive method
# we take in the array to be sorted/partitioned and the indexes where
# we want to sort them by left index starts as 0 and right is 
# one less than the length of the array because indexing starts with 0
def recursive_dual_pivot_quicksort(array, left_index, right_index)
    # verification we have valid starting indexes
    if left_index < right_index
        # partition and retrive new indexes 
        # new indexes will be used on the three
        # partitions that are created using the partition method
        left_pivot_index, right_pivot_index = partition(array, left_index, right_index)
        # byebug # debug breakpoint
        # recurse (is that a word?) on each of the
        # three sections we've divided the array into
        # instead of the default 0 and array.length - 1
        # we use the pivot indexes gained from partition()
        recursive_dual_pivot_quicksort(array, left_index, left_pivot_index - 1)
        # byebug # debug breakpoint
        recursive_dual_pivot_quicksort(array, left_pivot_index + 1, right_pivot_index -1)
        # byebug # debug breakpoint
        recursive_dual_pivot_quicksort(array, right_pivot_index + 1, right_index)
        # output result of sorting
        # byebug # debug breakpoint
        return array
    end
    # return the array we didn't sort
    # this should mean it's too small to sort 
    # or we received bad method parameters.
    return array
end

def partition(array, left_index, right_index)
    # check initial two values and sort them
    if array[left_index] > array[right_index]
        # swap returns two values that we assigned back to input values
        array[left_index], array[right_index] = array[right_index], array[left_index]
    end
    # create a far left reference index to use within comparison loop
    left_reference = left_index + 1
    # create a far right reference index to use within comparison loop
    right_reference = right_index - 1
    # create a "moving" reference that will move every iteration of the loop
    # and then be used in most comparisons to shift values according to pivot values
    moving_reference = left_index + 1
    # grap the values of both left and right indexes
    # to be used for comparisons as we "move" through the array
    left_pivot_value = array[left_index]
    right_pivot_value = array[right_index]
    # "move" through array until you meet or beat right limite/reference
    while moving_reference <= right_reference
        # validate all referenced values against nil
        nil_check(array[left_reference])
        nil_check(array[right_reference])
        nil_check(array[moving_reference])

        # see if moving reference is less than left
        if array[moving_reference] < left_pivot_value
            # swap the two values and increase the left_reference
            # since we know that it is in a good place
            array[moving_reference], array[left_reference] = array[left_reference], array[moving_reference]
            left_reference += 1
        # see if the moving reference is more or equal to our right pivot
        # which would indicate it shouldbe partitioned in the "right" section
        elsif array[moving_reference] >= right_pivot_value
            # check to make sure that we don't swap out a value that should be in the 
            # "right" partition by checking the right reference
            # also ensure we don't move our right reference past our moving reference
            while array[right_reference] > right_pivot_value and moving_reference < right_reference
                # move the reference since the value indicates it's 
                # already in the correct position
                right_reference -= 1
            end
            # now that we have a value in right reference that doesn't belong
            # or that is about to interfere with the moving reference
            # and a moving value bigger than right pivot value
            # we swap moving value and right ref value
            array[moving_reference], array[right_reference] = array[right_reference], array[moving_reference]
            # swapped right ref so decrease it for next loop
            right_reference -= 1
            # now that we have a new value in our moving ref
            # because of the swap with right ref
            # we want to check this new value to see if it belongs
            # elsewhere. elswhere would be in the "left" partition
            if array[moving_reference] < left_pivot_value
                # same code as the first if statement after we entered the main
                # while loop. swap and increment
                array[moving_reference], array[left_reference] = array[left_reference], array[moving_reference]
                left_reference += 1
            end
        end
        # increment by one to "move" before starting next loop
        moving_reference += 1
    end
    # put the references back into "pivot" position since they would be off by one
    # during the previous while loop.
    left_reference -= 1
    right_reference += 1
    # our left_index and right_index never moved because we 
    # started our reference one off (i.e. left_reference = left_index + 1)
    # now we swap the left reference with that initial left index
    # putting the values in the appropriate spot in the array
    array[left_index], array[left_reference] = array[left_reference], array[left_index]
    array[right_index], array[right_reference] = array[right_reference], array[right_index]
    # return new dividing points for use on the next array
    return left_reference, right_reference
end

# ensure the array doesn't contain nil values
def nil_check(value)
    if value.nil?
        # throw an error if there is a nil value.
        raise "A value was nil! only use arrays that don't contain nil."
    end
end