use context starter2024
#1
fun area(width :: Number, height :: Number) -> Number:
  doc: "Returns the area using the inputted width and height"
  width * height
end

#2

#|
   cost = (5 * num-tshirt) + (0.1 * num-chars)
cost = (5 * 4) + (0.1 * 7)
cost = (5 * 7) + (0.1 * 10)
|#

fun tshirt-cost(num-tshirt :: Number, num-chars :: Number) -> Number:
  doc: "Returns the cost of an inputted number of t-shirts with an inputted number of characters"
  (5 * num-tshirt) + (0.1 * num-chars)
end

#3
fun celsius-to-fahrenheit(celsius-temp :: Number) -> Number:
  doc: "Converts the inputted Celsius temperature to Fahrenheit and returns it"
  (celsius-temp * 9/5) + 32
end

fun fahrenheit-to-celsius(fahrenheit-temp :: Number) -> Number:
  doc: "Converts the inputted Fahrenheit temperature to Celsius and returns it"
  (fahrenheit-temp - 32) * 5/9
end

check:
  celsius-to-fahrenheit(0) is 32
  fahrenheit-to-celsius(32) is 0
  celsius-to-fahrenheit(100) is 212
  fahrenheit-to-celsius(212) is 100
end


#4
fun threestripe-triangle(
    top :: String,
    middle :: String,
    bottom :: String,
    triangle-colour :: String
    )
  -> Image:
  doc: "Returns a flag with 3 stripes and a triangle"
  
  background1 = rectangle(400, 100, "solid", bottom)
  background2 = above(rectangle(400, 100, "solid", middle), background1)
  background3 = above(rectangle(400, 100, "solid", top), background2)
  triangle1 = rotate(270, triangle(275, "solid", triangle-colour))
  overlay-align("left", "middle", triangle1, background3)
end
  