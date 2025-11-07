use context starter2024
data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])

#1
fun count-species(t :: TaxonomyTree) -> Number:
  if t.rank == "Species":
    1 + c-s(t.children)
  else:
    c-s(t.children)
  end
where:
  count-species(felidae) is 5
end

fun c-s(c :: List<TaxonomyTree>):
  cases (List) c:
    | empty => 0
    | link(f, r) => count-species(f) + c-s(r)
  end
end

#2
fun count-rank(t :: TaxonomyTree, rank :: String) -> Number:
  if t.rank == rank:
    1 + c-r(t.rank, rank)
  else:
    c-r(t.rank, rank)
  end
where:
  count-rank(felidae, "Genus") is 2
  count-rank(felidae, "Species") is 5
end

fun c-r(c :: List<TaxonomyTree>, rank):
  cases (List) c:
    | empty => 0
    | link(f, r) => count-rank(f, rank) + c-r(r, rank)
  end
end

#3
fun taxon-height(t :: TaxonomyTree) -> Number:
  df
end

fun t-height(c :: List<TaxonomyTree>):
  cases (List) c:
    | empty => 0
    | link(f, r) => 
  end
end