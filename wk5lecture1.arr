use context dcic2024
include csv

voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

#|
   Plan for #1
   "normalise-date" is a function that standardises the date format to ISO format (YYYY-MM-DD).
|#

fun normalise-date(s :: String) -> String:
  doc: "Standardises the date format to ISO format (YYYY-MM-DD)"
  
  day = string-substring(s, 0, 2)
  month = string-substring(s, 3, 5)
  year = string-substring(s, 6, 10)
  
  year + "-" + month + "-" + day
where:
  normalise-date("12/05/1975") is "1975-05-12"
  normalise-date("11-11-1970") is "1970-11-11"
end

date-of-birth = transform-column(voter-data, "DOB", normalise-date)


#|
   Plan for #2
   "normalise-postcode" transforms all postcodes to be: all caps, the first part of the postcode to be up to 4 characters long, followed by a space, and then the last part being only 3 characters.
|#

fun normalise-postcode(s :: String) -> String:
  doc: "Standardises the postcode format in the voter-data table."
  
  no-space-postcode = string-replace(s, " ", "")
  
  postcode-length = string-length(no-space-postcode)
  second-half-postcode = string-substring(no-space-postcode, postcode-length - 3, postcode-length)
  
  
  space-postcode = string-replace(no-space-postcode, string-substring(no-space-postcode, postcode-length - 3, postcode-length), " ")
  final-postcode = space-postcode + second-half-postcode
  
  all-caps-postcode = string-to-upper(final-postcode)
  all-caps-postcode
where:
  normalise-postcode("BR1 5TG") is "BR1 5TG"
  normalise-postcode("B124CN") is "B12 4CN"
  normalise-postcode("l14 2de") is "L14 2DE"
  normalise-postcode("l142de") is "L14 2DE"
end

standard-postcode = transform-column(voter-data, "Postcode", normalise-postcode)