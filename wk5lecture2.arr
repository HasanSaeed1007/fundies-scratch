use context starter2024
import math as M
import statistics as S

#1
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
unique-codes = distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)

uppercase-codes = map(string-to-upper, real-codes)

#2
survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

unique-responses = distinct(survey-responses)

fun is-real-response(response :: String) -> Boolean:
  not(string-to-lower(response) == "maybe")
end
real-responses = filter(is-real-response, unique-responses)

lowercase-responses = map(string-to-lower, real-responses)

#3
fun product(num-list :: List) -> Number block:
  var total = 1
  for each(n from num-list):
    total := total * n
  end
  total
where:
  product([list: 1, 2, 3]) is 6
end

#4
fun sum-even-numbers(num-list :: List) block:
  var total = 0
  for each(n from num-list):
    if num-modulo(n, 2) == 0:
      total := total + n
    else:
      total := total + 0
    end
  end
  total
where:
  sum-even-numbers([list: 1, 2, 3, 4]) is 6
end

#5
fun my-length(my-list :: List) block:
  var num-elements = 0
  for each(n from my-list):
    num-elements := num-elements + 1
  end
  num-elements
where:
  my-length([list: 1, 2, 3, 4]) is 4
end

#6
fun my-doubles(num-list :: List) block:
  var original = num-list[n]
  doubles-list = [list: ""]
  for each(n from num-list):
    original = original * 2
    doubles-list = 
  end
  