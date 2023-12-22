#region Chapter1

println("Hello, Julia!") #printing outputs
1+1 # adding numbers

#endregion

#region Chapter2

# Variable assignment

my_variable = "awesome"
α = 1

# Functions

## computing the square root
function square(x)
    return x*x # function body
end
square(3)

## or
square(x) = x * x

# Vectors
first_vector = [1, 2, 3]
first_vector[1] = 10 # 1-based indexing: 1st element of an vector has index 1
first_vector

# Operation on Vectors
second_vector = [4,5,6]
first_vector - second_vector

## concatenation of Vectors
concatenated_vector = [first_vector; second_vector] # option 1: ;
concatenated_vector = vcat(first_vector, second_vector) # option 2: vcat

## Broadcasting
sqrt.(first_vector) # element-wise operation using the broadcast operator .
first_vector .* second_vector # . required to avoid matrix multiplication

# Sequences
integer_sequence = 1:10
even_sequence = 2:2:10
collect(even_sequence) # convert sequence into array/vector

# Matrices
my_matrix = [1 2 3; 4 5 6]
# or alternatively:
my_matrix =
    [1 2 3
    4 5 6]
my_matrix
upper_left_element = my_matrix[1,1]
lower_right_element = my_matrix[2,3]

# For loops
for i in 1:5
    println(i^2)
end

# Conditional evaluation 
number = -3
## check if number is positive, negative or zero
if number > 0
    println("The number is positive")
elseif number < 0
    println("The number is negative")
else
    println("The number is zero")
end

# Packages
using Example # activate/load installed Packages
hello("world")

# Task: Function for division
function division(arg1, arg2)
    return arg1/arg2
end
division(9,2)

# Task: Element-wise square
base_vector = [1,2,3,4,5]
base_vector.^2

# Exercise

#endregion