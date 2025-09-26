use context dcic2024
include csv
include data-source

#1
plant-sightings = load-table:
  plant_common_name :: String,
  location_latitude :: Number,
  location_longitude :: Number,
  date_sighted :: String,
  soil_type :: String,
  plant_height_cm :: Number,
  plant_color :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
  sanitize location_latitude using num-sanitizer
  sanitize location_longitude using num-sanitizer
  sanitize plant_height_cm using num-sanitizer
end

plant-sightings.row(30)
plant-sightings.length()

#2
glucose-levels = load-table:
  patient_id :: Number,
  glucose_level :: Number,
  date_time :: String,
  insulin_dose :: Number,
  exercise_duration :: Number,
  stress_level :: Number
  source: csv-table-file("glucose_levels.csv", default-options)
  sanitize patient_id using num-sanitizer
  sanitize glucose_level using num-sanitizer
  sanitize insulin_dose using num-sanitizer
  sanitize exercise_duration using num-sanitizer
  sanitize stress_level using num-sanitizer
end

lr-plot(glucose-levels, "glucose_level", "insulin_dose")