use context dcic2024

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

#1
fun ten-percent-closerx(x):
  doc: "Brings all x-coordinates 10% closer to the player"
  x * 0.9
end

fun ten-percent-closery(y):
  doc: "Brings all y-coordinates 10% closer to the player"
  y * 0.9
end

moved-itemsx = transform-column(items, "x-coordinate", ten-percent-closerx)

moved-itemsy = transform-column(items, "y-coordinate", ten-percent-closery)

#2
fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  rough-distance = num-sqrt(
    num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
  num-exact(rough-distance)
end

items-with-distance = build-column(items, "distance", calc-distance)

order-by(items-with-distance, "distance", true)

#3
name-of-items = table: item-name :: String
  row: "Sword of Dawn"
  row: "Healing Potion"
  row: "Dragon Shield"
  row: "Magic Staff"
  row: "Elixir of Strength"
  row: "Cloak of Invisibility"
  row: "Ring of Fire"
  row: "Boots of Swiftness"
  row: "Amulet of Protection"
  row: "Orb of Wisdom"
end


fun obfuscate(item :: Table):
  doc: "Obfuscates the item names to XXXXX.  The number of Xs depends on the number of characters, including spaces, in the item name"
  transform-column(name-of-items, "item-name", lam(n): 
    string-repeat("X", string-length(n)) end)
where:
  test-table =
    table: item-names
      row: "Hello"
      row: "Goodbye"
      row: "My name is Hasan"
    end
  obfuscate(test-table) is
  table: item-names
    row: "XXXXX"
    row: "XXXXXXX"
    row: "XXXXXXXXXXXXXXXXX"
  end  
end

obfuscate(name-of-items)