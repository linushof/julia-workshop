println("Hello, Julia!") #printing outputs
1+1 # adding numbers

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

function regression(α, β, X)
     y = α .+ β*X
    return y
end

base_vector

regression(1,2,base_vector)


using Random
Random.seed!(1234)

x = 10 .+ 3*randn(20)

y = regression(1000, 300, x)


y+=500*randn(20)
y


function error(obs, pred)
    return sum((obs - pred).^2)
end

first_vector = [1,2,3]
second_vector = [4,5,6]

error(first_vector, second_vector)

function squared_error_regression(α, β, x, y)
    ŷ = regression(α,β,x)
    return error(y,ŷ)
end

squared_error_regression(200, 100, x,y)
squared_error_regression(1000, 300, x,y)



# Theory

## create a hierachy of pokemon
abstract type Pokemon end
abstract type Normal <: Pokemon end # Normal as a subtype of Pokemon
abstract type Flying <: Pokemon end
abstract type Electric <: Pokemon end

# create Pikachu
struct Pikachu <: Electric
    nickname
    attack
    defense
    speed
    hp
end
my_pikachu = Pikachu("Pika", 135, 80, 110, 132)
my_pikachu  
my_pikachu.attack

# new Flying pokemon
struct Laui <: Flying
    nickname
    attack
    defense
    speed
    hp
end

my_laui = Laui("Laui", 100, 100, 90, 150)
my_laui.nickname

# constructors: functions that create new objects

## outer constructors: add default values for convenience

import Random: randstring
Pikachu(attack, defense, speed, hp) = Pikachu(randstring(10), attack, defense, speed, hp)
weird_pikachu = Pikachu(132, 34, 23, -12)

## inner constructors: define permissible values

struct Pichu <: Electric
    nickname
    attack
    defense
    speed
    hp
    function Pichu(nickname, attack, defense, speed, hp)
        if (attack < 0) | (defense < 0) | (speed < 0) | (hp < 0)
            error("Your Pokemon's stats are outside the valide range")
        else
            return new(nickname, attack, defense, speed, hp)
        end
    end
end

weird_pichu = Pichu("Pika_2.0", 132, 34, 23, -12)