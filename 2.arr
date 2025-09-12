use context starter2024

#1
string-to-upper("hello cs2000!")

#2
c1 = circle(20, "solid", "blue")
c2 = rectangle(80, 60, "solid", "yellow")
overlay(c1, c2)

#3
r1 = rectangle(80, 60, "solid", "green")
r2 = rectangle(80, 60, "solid", "purple")
above(r1, r2)

#4
rectangle(100, 20, "solid", "red")
rotate(90, rectangle(100, 20, "solid", "red"))

#5
o1 = regular-polygon(80, 8, "solid", "red")
stop = text("STOP", 75, "white")
overlay-align("middle", "center", stop, o1)

#6 Making a give way sign
t1 = regular-polygon(2500, 3, "solid", "red")
t2 = regular-polygon(2200, 3, "solid", "white")
sign = rotate(180,
  overlay-align("middle", "center", t2, t1))
giveway = text("Give Way", 250, "black")
overlay-align("middle", "center", giveway, sign)
