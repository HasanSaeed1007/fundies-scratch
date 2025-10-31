use context starter2024
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

#1 - Use scalar processing
fun count-streams(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) =>
      count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end
where:
  count-streams(main-river) is 3
end

#2 - Use scalar processing
fun max-width(r :: River) -> Number:
  doc: "Finds the maximum width among all merge points in a river network"
  cases (River) r:
    | merge(width, left, right) =>
      num-max(width, num-max(max-width(left), max-width(right)))
    | stream(flow) => 0
  end
where:
  max-width(main-river) is 15
end

#3 - Use transformation
fun widen-river(r :: River, num :: Number) -> River:
  cases (River) r:
    | merge(width, left, right) =>
      merge(
        width + num,
        widen-river(left, num),
        widen-river(right, num))
    | stream(flow) => stream(flow)
  end
where:
  widen-river(main-river, 10).width is 25
end

#4 - Use transformation
fun cap-flow(r :: River, cap-rate) -> River:
  cases (River) r:
    | merge(width, left, right) =>
      merge(width,
        cap-flow(left, cap-rate),
        cap-flow(right, cap-rate))
    | stream(flow) =>
      if flow < cap-rate:
        stream(flow)
      else:
        stream(cap-rate)
      end
  end
end

#5 - Use scalar processing
fun has-large-stream(r :: River) -> Boolean:
  cases (River) r:
    | merge(width, left, right) =>
      has-large-stream(left) or has-large-stream(right)
    | stream(flow) => 
      if flow > 5:
        true
      else:
        false
      end
  end
where:
  has-large-stream(main-river) is true
end
  