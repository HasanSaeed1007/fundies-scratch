use context starter2024
include image

#1 T-Shirt Shop
#1.1 Calculating cost
(12 * 5) + 3
(12 * 7) + 3
# Comparison - For identical T-shirts with the same design, the price difference is explained by however many T-shirts are being purchased.

#1.2 Rectangular Poster
width = 420
height = 594
perimeter = 2 * (width + height)
perimeter * 0.10

#If you forget parentheses, the expression would be computed as 2 * width + height, so the width would be multiplied by 2 and the height added to this value.

#2 String Surprises
#2.1 Saving a tagline
"Designs for everyone"
#When parentheses are removed, there is an error.  For a string to be displayed, there must be double/single quotation marks enclosing the string.

#2.2 Colour inventory
"red" + "blue"
#Merges the two strings together with no spaces between them
#1 + "blue" gives an error, as any expression with a '+' expects to be given two numbers or two strings, not one of each.

#3 Make a Traffic Light

traffic_light_red = overlay-align("center", "top",
  circle(15, "solid", "red"), rectangle(40, 100, "solid", "black"))

traffic_light_yellow = overlay-align("center", "middle",
  circle(15, "solid", "yellow"), traffic_light_red)

traffic_light_green = overlay-align("center", "bottom",
  circle(15, "solid", "green"), traffic_light_yellow)

traffic_light_green

#4
#Creates a solid black rectangle with width 50 and height 20
rectangle(50, 20, "solid", "black")
#Creates a solid red circle with radius 30
circle(30, "solid", "red")


#5
background1 = rectangle(400, 100, "solid", "dark-green")
#Creates a solid dark green strip to act as the bottom of the flag

background2 = above(rectangle(400, 100, "solid", "white"), background1)
#Adds a solid white strip to act as the middle of the flag above the dark green strip created previously

background3 = above(rectangle(400, 100, "solid", "black"), background2)
#Adds a solid black strip to act as the top of the flag above the white and dark green stripes that have been created previously.

triangle1 = rotate(270, triangle(275, "solid", "red"))
#Creates and rotates a solid red triangle 270 degrees anti-clockwise

final_flag = overlay-align("left", "middle", triangle1, background3)
#Overlays the red triangle over the background and aligns it to the left of the flag.

final_flag
#Prints the final flag