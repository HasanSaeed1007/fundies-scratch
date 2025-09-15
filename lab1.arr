use context starter2024
include image

# 1 T-Shirt Shop
# 1.1 Calculating cost
(12 * 5) + 3
(12 * 7) + 3
# Comparison - For identical T-shirts with the same design, the price difference is explained by however many T-shirts are being purchased.

# 1.2 Rectangular Poster
width = 420          # Assign width a value
height = 594         # Assign height a value
perimeter = 2 * (width + height)     # Perimeter formula
perimeter * 0.10     # Calculating price

# If you forget parentheses, the expression would be computed as 2 * width + height, so the width would be multiplied by 2 and the height added to this value.

# 2 String Surprises
# 2.1 Saving a tagline
"Designs for everyone"
# When parentheses are removed, there is an error.  For a string to be displayed, there must be double/single quotation marks enclosing the string.

# 2.2 Colour inventory
"red" + "blue"
# Merges the two strings together with no spaces between them
# 1 + "blue" gives an error, as any expression with a '+' expects to be given two numbers or two strings, not one of each.

# 3 Make a Traffic Light

traffic_light_red = overlay-align("center", "top",
  circle(15, "solid", "red"), rectangle(40, 100, "solid", "black"))
# Creates a red circle which is overlayed over a solid black rectangle and aligned to the top and center of that rectangle

traffic_light_yellow = overlay-align("center", "middle",
  circle(15, "solid", "yellow"), traffic_light_red)
# Creates a yellow circle which is overlayed over the solid black rectangle and aligned with the red circle created previously

traffic_light_green = overlay-align("center", "bottom",
  circle(15, "solid", "green"), traffic_light_yellow)
# Creates a green circle which is overlayed over the solid black rectangle and aligned with the red and yellow circles created previously.

traffic_light_green

# 4
# Creates a solid black rectangle with width 50 and height 20
rectangle(50, 20, "solid", "black")
# Swapped the second and third argument around.  Arguments must follow the order of dimension1, dimension2, solid/outline, colour

# Creates a solid red circle with radius 30
circle(30, "solid", "red")
# Quotation marks must be put around the string arguments.  In this case, the second argument required quotation marks ("solid" rather than solid)

# 5
background1 = rectangle(400, 100, "solid", "dark-green")
# Creates a solid dark green strip to act as the bottom of the flag

background2 = above(rectangle(400, 100, "solid", "white"), background1)
# Adds a solid white strip to act as the middle of the flag above the dark green strip created previously

background3 = above(rectangle(400, 100, "solid", "black"), background2)
# Adds a solid black strip to act as the top of the flag above the white and dark green stripes that have been created previously.

triangle1 = rotate(270, triangle(275, "solid", "red"))
# Creates and rotates a solid red triangle 270 degrees anti-clockwise

final_flag = overlay-align("left", "middle", triangle1, background3)
# Overlays the red triangle over the background and aligns it to the left of the flag.

final_flag
# Prints the final flag

