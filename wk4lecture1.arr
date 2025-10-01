use context dcic2024
include csv
include data-source

#1
orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

is-morning-orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95  
end

fun is-morning(o :: Row) -> Boolean:
  o["time"] < "12:00"
where:
  is-morning(orders.row-n(2)) is true
  is-morning(orders.row-n(4)) is false
end

only-morning-orders = filter-with(orders, is-morning)

check:
  only-morning-orders is is-morning-orders
end

filter-with(orders, lam(o): o["time"] < "12:00" end)

order-by(orders, "time", false)

#2
locations = load-table:
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/photos.csv", default-options)
end

filter-with(locations, lam(o): o["subject"] == "Forest" end)
order-by(locations, "date", false)

order-location-by-date = order-by(locations, "date", false)

order-count = count(locations, "location")
order-by(order-count, "count", false)

locations-bar-chart = freq-bar-chart(locations, "location")