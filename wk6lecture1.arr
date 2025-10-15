use context starter2024
#1 Temperature
data Temperature:
  | celsius(degrees :: Number)
  | fahrenheit(degrees :: Number)
  | kelvin(degrees :: Number)
end

fun to-celsius(t :: Temperature) -> Number:
  cases(Temperature) t:
    | celsius(d) => d
    | fahrenheit(d) => (5 / 9) * (d - 32)
    | kelvin(d) => d - 273.15
  end
where:
  body-temp = fahrenheit(100)
  to-celsius(body-temp) is%(within-abs(0.1)) 37.7
end

#2 Task Planner
data Priority:
  | low
  | medium
  | high
end

task-1-priority = low
task-2-priority = high
task-3-priority = medium


data Status:
  | todo
  | in-progress
  | done
end

data Task:
  | task(description :: String, priority :: Priority, status :: Status)
  | note(description :: String)
  | status(description :: Status)
end

task-1 = task("Buy groceries", low, in-progress)
task-2 = task("Pay council tax", high, todo)
note-1 = note("Post Office closes at 4:30")

fun priority-to-string(p :: Priority) -> String:
  cases (Priority) p:
    | low => "❕TASK:"
    | medium => "❗️TASK:"
    | high => "‼️ TASK:"
  end
end

fun status-to-string(s :: Status) -> String:
  cases (Status) s:
    | todo => "TO DO"
    | in-progress => "IN PROGRESS"
    | done => "DONE"
  end
end

fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p, s) => priority-to-string(p) + " " + d + " - " + status-to-string(s)
    | note(d) => "📝 " + d
  end
end

#3 Weather Report
data WeatherReport:
  | sunny(temperature :: Number)
  | rainy(temperature :: Number, precipitation :: Number)
  | snowy(temperature :: Number, precipitation :: Number, wind-speed :: Number)
end

fun is-severe(w :: WeatherReport) -> String:
  if (w == "rainy") and (precipitation > 20):
    cases (WeatherReport) w:
      | rainy(t, p) => "True"
    end
  else if (w == "snowy") and (wind-speed > 30):
    cases (WeatherReport) w:
      | snowy(t, p, wind-speed) => "True"
    end
  else if (w == "sunny") and (temperature > 35):
    cases (WeatherReport) w:
      | sunny(t) => "True"
    end
  else:
    "False"
  end
end

