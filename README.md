# dualPivotQuickSort
My Ruby implementation of a dual pivot quick sort. for Top Coder

## Challenge Overview

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using dual_pivot_quicksort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). These files are provided in the code documents. You can complete the task by making as many or as little methods or classes in the dual_pivot_quicksort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the dual_pivot_quicksort.rb file and the test will pass but you will fail the challenge.
As we know, the single pivot quick sort takes a pivot from one of the ends of the array and partitioning the array, so that all elements are left to the pivot are less than or equal to the pivot, and all elements that are right to the pivot are greater than the pivot.

The idea of dual pivot quick sort is to take two pivots, one in the left end of the array and the second, in the right end of the array. The left pivot must be less than or equal to the right pivot, so we swap them if necessary.
Then, we begin partitioning the array into three parts: in the first part, all elements will be less than the left pivot, in the second part all elements will be greater or equal to the left pivot and also will be less than or equal to the right pivot, and in the third part all elements will be greater than the right pivot. Then, we shift the two pivots to their appropriate positions as we see in the below bar, and after that we begin quicksorting these three parts recursively, using this method.

## Submission Guidelines

You must include a README.md file with instructions on how to install/run your code.

Add comments to what your models, controllers, functions or methods are accomplishing.

You must include a video (annotated or narrated) demo of your code