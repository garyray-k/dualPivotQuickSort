include RSpec

def dual_pivot_quicksort(array)
    # ensure we're working with an array with some substance. 
    # if it's empty or only has one, give it back, because it's already sorted
    if array.empty? or array.length == 1
        return array
    end
    # identify the two pivot points and put them into a variable
    # swap positions if necessary
    
    # if array.length == 2 then check only pivots and return array
    # iterate over array and sort based on pivots points
    # create three arrays to dump values into for each variable
    # if less than left -> left array; 
    # if equal to left -> left array last element
    # if greater than right -> right array; 
    # if equal to right; right array first element
    # else dump into center array

    # sort left array
    # sort center array
    # sort right array

    # append left-center-right
    # output results
    
end

# ensure the array doesn't contain nil values
def nil_check(value)
    if value.nil?
        # throw an error if there is a nil value.
        raise "A value was nil! only use arrays that don't contain nil."
end