use context starter2024

#1
fun choose-hat1(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below 10C a winter hat and between the two nothing."
  if temp-in-C >= 27:
    "sun hat"
  else if temp-in-C >= 10:
    "no hat"
  else:
    "winter hat"
  end
where:
  choose-hat1(25) is "no hat"
  choose-hat1(32) is "sun hat"
  choose-hat1(27) is "sun hat"
end

fun choose-hat2(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below 10C a winter hat and between the two nothing"  
  ask:
    |temp-in-C >= 27 then: "sun hat"
    |temp-in-C >= 10 then: "no hat"
    |otherwise: "winter hat"
  end
where:
  choose-hat2(25) is "no hat"
  choose-hat2(32) is "sun hat"
  choose-hat2(27) is "sun hat"
end

#2
fun add-glasses(outfit :: String):
  doc: "takes an outfit as a string and outputs 'and glasses'"
  outfit + " and glasses"

where:
  add-glasses("t-shirt and trousers") is "t-shirt and trousers and glasses"
end

#3
fun choose-outfit(temp-in-C :: Number, outfit :: String) -> String:
  doc: "takes the input as temperature in celsius and uses the add-glasses and choose-hat2 functions to compute a final outfit"
  ask:
    |choose-hat2 == "sun hat" then: outfit + " and glasses and sun hat"
    |choose-hat2 == "winter hat" then: outfit + " and glasses and winter hat"
    |otherwise: outfit + " and glasses"
  end
where:
  choose-outfit(25, "trousers and t-shirt") is "trousers and t-shirt and glasses"
end

#4
fun choose-hat-or-visor(temp-in-c :: Number, has-visor :: Boolean):
  doc: "takes the temperature in celsius and the boolean has a visor to determine whether to wear a hat or a visor"
  ask:
    |(temp-in-c > 30) and has-visor then: "Wear visor"
    |otherwise: "Wear " + choose-hat2(temp-in-c)
  end
where:
  choose-hat-or-visor(32, true) is "Wear visor"
  choose-hat-or-visor(15, true) is "Wear no hat"
end