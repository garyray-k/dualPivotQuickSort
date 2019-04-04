include RSpec
# byebug is a CLI debugger for Ruby
# require 'byebug'
require_relative 'dual_pivot_quicksort'

describe "#dual_pivot_quicksort" do
  it "moves the largest integer to the end of the array" do
    expect( dual_pivot_quicksort([6,10,2,5,8,14,12,3,4,1,7,0]) ).to end_with 14
  end

  it "moves the smallest integer to the front of the array" do
    expect( dual_pivot_quicksort([6,2,5,3,4]) ).to start_with 2
  end

  it "handles an empty array" do
    expect( dual_pivot_quicksort([]) ).to eq []
  end

  it "handles an array of length one" do
    expect( dual_pivot_quicksort([1]) ).to eq [1]
  end

  let (:sorted_array) { [1,2,3,4,5,6] }
  let (:shuffled_array) { sorted_array.shuffle }

  it "sorts the array from least to greatest" do
    expect( dual_pivot_quicksort([6,2,5,3,4]) ).to eq [2,3,4,5,6]
    expect( dual_pivot_quicksort(shuffled_array) ).to eq sorted_array
  end

  it "handles zero appropriately" do
    expect( dual_pivot_quicksort([6,2,5,3,4,0]) ).to start_with 0
  end

  it "handles negative numbers appropriately" do
    expect( dual_pivot_quicksort([6,2,-11, 5,3,4]) ).to start_with -11
  end

  it "handles a larger array" do
    expect( dual_pivot_quicksort([25, 16, 3, 10, 8, 7, 17, 13, 2, 18, 15, 21, 12, 22, 4, 14, 23, 11, 19, 9])).to eq [25, 16, 3, 10, 8, 7, 17, 13, 2, 18, 15, 21, 12, 22, 4, 14, 23, 11, 19, 9].sort
  end

  it "raises" do
    expect { dual_pivot_quicksort([1, 2, 4, 2, 4, 1, nil, 0, 49, 3]) }.to raise_error(RuntimeError)
  end
end