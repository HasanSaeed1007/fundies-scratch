use context starter2024

#1
fun string-concat(l :: List):
  cases (List) l:
    | empty => ""
    | link(f, r) => f + " " + string-concat(r)
  end
where:
  string-concat([list: "hello", "i'm", "hasan"]) is "hello i'm hasan" + " "
  
  string-concat([list: "hello", "i'm", "hasan"]) is "hello" + " " + string-concat([list: "i'm", "hasan"])
  
  string-concat([list: "i'm", "hasan"]) is "i'm" + " " + string-concat([list: "hasan"])
  
  string-concat([list: "hasan"]) is "hasan" + string-concat([list: ]) + " "
  
  string-concat([list: ]) is ""
end

#2
fun strings-upper(l :: List) -> List:
  cases (List) l:
    | empty => empty
    | link(f, r) => link(string-to-upper(f), strings-upper(r))
  end
where:
  strings-upper([list: "hello", "i'm", "hasan"]) is [list: "HELLO", "I'M", "HASAN"]
  
  strings-upper([list: "hello", "i'm", "hasan"]) is link("HELLO", strings-upper([list: "i'm", "hasan"]))
  
  strings-upper([list: "i'm", "hasan"]) is link("I'M", strings-upper([list: "hasan"]))
  
  strings-upper([list: "hasan"]) is link("HASAN", strings-upper([list: ]))
  
  strings-upper([list: ]) is empty
end

#3
fun round-numbers(l :: List) -> List:
  cases (List) l:
    | empty => empty
    | link(f, r) => link(num-round(f), round-numbers(r))
  end
where:
  round-numbers([list: 2.3, 5.7, 8.1]) is [list: 2, 6, 8]
  
  round-numbers([list: 2.3, 5.7, 8.1]) is link(2, round-numbers([list: 5.7, 8.1]))
  
  round-numbers([list: 5.7, 8.1]) is link(6, round-numbers([list: 8.1]))
  
  round-numbers([list: 8.1]) is link(8, round-numbers([list: ]))
  
  round-numbers([list: ]) is empty
end