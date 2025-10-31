use context starter2024

#1
fun more-than-five(l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if string-length(f) > 5:
        link(f, more-than-five(r))
      else:
        more-than-five(r)
      end
  end
where:
  more-than-five([list: "Window", "Kitchen", "Bed", "Chair"]) is [list: "Window", "Kitchen"]
end

#2
fun my-average(l):
  cases (List) l:
    | empty => raise("Error: List is empty")
    | link(f, r) =>
      cases (List) r:
        | empty => f
        | else => my-sum(l) / my-len(l)
      end
  end
where:
  my-average([list: 2, 4, 9]) is 5
end
  
  
fun my-len(l):
  cases (List) l:
    | empty      => 0
    | link(f, r) => 1 + my-len(r)
  end
where:
  my-len([list: 7, 8, 9]) is 3
end
  
fun my-sum(l):
  cases (List) l:
    | empty      => 0
    | link(f, r) => f + my-sum(r)
  end
where:
  my-sum([list: 7, 8, 9]) is 24
end

#3
fun my-max(l):
  max(0, l)
where:
  my-max([list: 3, 2, 6, 4]) is 6
end

fun max(biggest-number-encountered, l):
  cases (List) l:
    | empty => biggest-number-encountered
    | link(f, r) =>
      if f > biggest-number-encountered:
        max(f, r)
      else:
        max(biggest-number-encountered, r)
      end
  end
end

#4
fun my-alternating(l):
  my-alternate(true, l)
where:
  my-alternating([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 5]
end

fun my-alternate(keep, l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      ask:
        | keep then: link(f, my-alternate(false, r))
        | otherwise: my-alternate(true, r)
      end
  end
end

#5
fun skip-elements(l, skip):
  skips(0, skip, l)
where:
  skip-elements([list: 1, 2, 3, 4, 5], 3) is [list: 1, 4]
end

fun skips(current-element, skip, l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      ask:
        | (current-element == skip) then: skips(0, skip, r)
        | otherwise: link(f, skips(current-element + 1, skip, r))
      end
  end
end