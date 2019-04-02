# dualPivotQuickSort - Ruby

My Ruby implementation of a dual pivot quick sort for Top Coder

## Challenge Overview

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using dual_pivot_quicksort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). These files are provided in the code documents. You can complete the task by making as many or as little methods or classes in the dual_pivot_quicksort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the dual_pivot_quicksort.rb file and the test will pass but you will fail the challenge.
As we know, the single pivot quick sort takes a pivot from one of the ends of the array and partitioning the array, so that all elements are left to the pivot are less than or equal to the pivot, and all elements that are right to the pivot are greater than the pivot.

The idea of dual pivot quick sort is to take two pivots, one in the left end of the array and the second, in the right end of the array. The left pivot must be less than or equal to the right pivot, so we swap them if necessary.
Then, we begin partitioning the array into three parts: in the first part, all elements will be less than the left pivot, in the second part all elements will be greater or equal to the left pivot and also will be less than or equal to the right pivot, and in the third part all elements will be greater than the right pivot. Then, we shift the two pivots to their appropriate positions as we see in the below bar, and after that we begin quicksorting these three parts recursively, using this method.

## How to install and run my Dual Pivot Quicksort using Ruby

### Installing Ruby and Rspec

For this challenge, I used `ruby-2.5.3`
To install ruby I recommend checking out the [Ruby Site](https://www.ruby-lang.org/en/documentation/installation/) and selecting the options that best fits your operatin system. While not needed, I also recommend installing a version manager for Ruby if you're going to continue develoment with Ruby. For my setup, I use [Ruby Version Manager](http://rvm.io/).

Next you'll want to ensure you have `rspec` installed. This is the testing tool used for the challende and can be installed using the `gem install rspec`. Additionally, you can confirm you already have it installed but checking your installed Ruby gems using `gem list`. Additional help can be found on the [rspec site](http://rspec.info/).

### Download my Code

My code can be found on and downloaded from [my GitHub](https://github.com/garyray-k/) or can be cloned using the Git command `git clone https://github.com/garyray-k/dualPivotQuickSort-Ruby.git`. If you run the Git clone, be sure to run it in the folder where you want to clone my code to.

### Running the Code

Once you have downloaded the code, you should have a folder titled "dualPivotQuickSort-Ruby". Open the command line into that folder. Listing the contents should show four files. 1. This `README.md` 2. `dual_pivot_quicksort.rb` 3. `dual_pivot_quicksort_spec.rb` 4. `.gitignore` (the last one may or may not show depending on your setup).

Then run `rspec dual_pivot_quicksort_spec.rb`. This runs through the 9 examples listed in `dual_pivot_quicksort_spec.rb` and they should all pass. Adding additional tests/examples is outside the scope of this `README.md` but feel free to add additional tests using similar formatting/structure to what is already present.

## Closing Remarks

This challenge was defnitely a **challenge**. I was in the middle of learning Ruby on Rails when I registered for this challenge so learning the language itself by using it was very helpful. Additionally, I don't have a CS degree or other similar background, so this was an introduction to sorting algorithms. Previously, I've only ever listened to audio podcasts about sorting algorithms. Actually writing one was a bit challenging. As you can see from the commit history, my first couple of attempts to roll this algorithm from just reading the challenge overview didn't work out. Then after studying the [dual-pivot-quicksort](https://www.geeksforgeeks.org/dual-pivot-quicksort/) itself, I had to determine the best names for the various variables so it would make sense to myself and make it easier to comment on and annotate the code.