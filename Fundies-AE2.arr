use context starter2024
include csv
import plots

penguins = load-table:
  ID :: Number,
  species :: String,
  island :: String,
  bill_length_mm :: Number,
  bill_depth_mm :: Number,
  flipper_length_mm :: Number,
  body_mass_g :: Number,
  sex :: String,
  year :: Number
  source: csv-table-file("penguins.csv", default-options)
end

#1 Scalar processing example
#Recursive function to find the difference
fun my-differences(d :: List<Row>) -> List<Number>:
  cases (List) d:
    | empty => 0
    | link(f, r) => link(f.flipper_length_mm - f.bill_length_mm, my-differences(r))
  end
end

#Recursive function to sum all of the differences found in the previous function
fun sums(nums :: List<Number>) -> Number:
  cases (List<Number>) nums:
    | empty => 0
    | link(f, r) => f + sums(r)
  end
end

#Recursive function to count how many differences there are
fun counts(nums :: List<Number>) -> Number:
  cases (List<Number>) nums:
    | empty => 0
    | link(f, r) => 1 + counts(r)
  end
end

#Function to calculate the mean
fun mean(nums :: List<Number>) -> Number:
  sums(nums) / counts(nums)
end

fun average-difference(tbl :: Table) -> Number:
  rows-list = tbl.rows()
  diffs = my-differences(rows-list)
  mean(diffs)
where:
  test-table = 
    table: differences
      row: 141.9
      row: 146.5
      row: 154.7
    end
  average-difference(differences) is
  (141.9 + 146.5 + 154.7) / 3 = 147.7
end


#2 Transformation
fun body-mass-g-to-kg(m :: List<Row>) -> List<Number>:
  cases (List<Row>) m:
    | empty => 0
    |link(f, r) => link(f.body_mass_g / 1000, body-mass-g-to-kg(r))
  end
end
  

plots.histogram(body-mass-in-kg, bins: 10, title: "Penguin Body Mass in kg")


#3 Selection

fun select-penguins(rows :: List<Row>) -> List<Row>:
  cases (List<Row>) rows:
    | empty => 0
    | link(f, r) =>
      if (f.species == "Gentoo") and (f.flipper_length_mm > 210):
        link(f, select-penguins(r))
      else:
        select-penguins(r)
      end
  end
end


#4 Accumulation

fun female-dream-mass(rows :: List<Row>) -> List<Number>:
  cases (List<Row>) rows:
    | empty => empty
    | link(f, r) =>
      if (f.sex == "female") and (f.island == "Dream"):
        link(f.body-mass-g / 1000, female-dream-mass(r))
      else:
        female-dream-mass(r)
      end
  end
end

fun sum-list(s :: List<Number>) -> Number:
  cases (List<Number>) s:
    | empty => 0
    | link(f, r) => f + sum-list(r)
  end
end

fun total-female-dream-mass(t :: Table):
  masses = female-dream-mass(t.rows())
  sum-list(masses)
end
  