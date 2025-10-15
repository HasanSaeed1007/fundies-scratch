use context dcic2024

include csv
include data-source

#| Task Plan
   In order to clean the data, I will be cleaning the data set by removing any potential duplicates, and also ensuring that the data in each of the columns is in a standardised format.  This will involve taking the hour and the minute of the departure and arrival times and concatenating these to create one column with the date and time, displayed in a standard format.
   
   The carrier column has inconsistent formatting in the form of extra spaces and lowercase letters.  To resolve this, I will clean the carrier column by trimming spaces and converting the text to uppercase using the string-to-upper string function.  Finally, I will use transform-column with a lambda function that applies trim and string-to upper to each value.
   
   The columns dep_time,sched_dep_time, arr_time and sched-arr-time all need to be cleaned and reformatted, such that all times will include four characters, so '839' will be reformatted as '0839'.
   
   
   Clean the tailnum column so that any missing values will be replaced with 'UNKNOWN'
   
   The distance column needs to be cleaned so that there are no additional spaces after distance values in order for the data to be sanitized by num-sanitizer
|#

flights_53 = load-table: rownames, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time-hour
  source: csv-table-file("flights_sample53.csv", default-options)
sanitize rownames using num-sanitizer
sanitize dep_time using num-sanitizer
sanitize sched_dep_time using num-sanitizer
sanitize dep_delay using num-sanitizer
sanitize arr_time using num-sanitizer
sanitize sched_arr_time using num-sanitizer
sanitize arr_delay using num-sanitizer
sanitize flight using num-sanitizer
sanitize air_time using num-sanitizer
sanitize hour using num-sanitizer
sanitize minute using num-sanitizer
end

# Create a function for the tailnum column which replaces any missing values with 'UNKNOWN'

fun blank-to-unknown(s :: String) -> String:
  doc: "Replaces any missing values in the tailnum column with 'UNKNOWN'"
  if s == "":
    new-s = "UNKNOWN"
    new-s
  else:
    s
  end
where:
  blank-to-unknown("") is "UNKNOWN"
  blank-to-unknown("N997DL") is "N997DL"
end

tailnum-blank-to-unknown = transform-column(flights_53, "tailnum", blank-to-unknown)

# Check the dep_delay and arr_delay columns. Replace any negative values with 0.  Also 

fun new-dep-delay = 